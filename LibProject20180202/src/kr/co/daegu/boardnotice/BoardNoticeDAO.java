package kr.co.daegu.boardnotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardNoticeDAO {
	public DataSource dataFactory;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<BoardNoticeDTO> noticeList;
	private int cnt;

	public BoardNoticeDAO() {
		try {
			Context ctx = new InitialContext();
			/*dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/kdh0115");*/
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = dataFactory.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardNoticeDTO> noticeList(BoardNoticeDTO noticeDTO){//전체출력
		try {
			sql = "select no,title,nal,author,readcount from boardnotice where visible=1 order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			noticeList = new ArrayList<BoardNoticeDTO>();
			while(rs.next()) {
				noticeDTO = new BoardNoticeDTO();
				noticeDTO.setNo(rs.getInt("no"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setNal(rs.getString("nal"));
				noticeDTO.setAuthor(rs.getString("author"));
				noticeDTO.setReadcount(rs.getInt("readcount"));
				noticeList.add(noticeDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticeList;
	}//전체출력
	
	public void noticeReadCount(BoardNoticeDTO noticeDTO) {//조회수증가
		try {
			sql = "update boardnotice set readcount=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeDTO.getReadcount()+1);
			pstmt.setInt(2, noticeDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//조회수증가
	
	public int totalCount(){//페이징처리: 전체레코드 개수 구하기
	     int count=0;
	     try {
	      sql = "select count(*) from boardnotice where visible=1";
	      pstmt = conn.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      if(rs.next()){
	       count = rs.getInt(1);
	      }
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }   
	     return count;
	    }//페이징처리: 전체레코드 개수 구하기
	
	public PageTo page(int curPage){//페이지구현
	     PageTo pageTo = new PageTo();
	     int totalCount = totalCount();
	     ArrayList<BoardNoticeDTO> list = new ArrayList<BoardNoticeDTO>();
	     try {
	      sql = "select no,title,author,content,nal,readcount from boardnotice where visible=1 order by no desc";
	      pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	      //TYPE_SCROLL_INSENSITIVE:scroll은 가능하나, 변경된 사항은 적용되지 않음
	      //양방향, 스크롤 시 업데이트 반영안함
	      //CONCUR_READ_ONLY :커서의 위치에서 정보 업데이트 불가,ResultSet의 변경이 불가능
	      rs = pstmt.executeQuery();
	      int perPage = pageTo.getPerPage();//5
	      int skip = (curPage-1) * perPage;
	      if(skip>0){
	       rs.absolute(skip);
	      }
	      //ResultSet의 absolute메소드를 이용하여 해당 페이지의 Cursor 의 위치로 이동...
	      for(int i=0;i<perPage && rs.next();i++){
	       int no = rs.getInt("no");
	       String author = rs.getString("author");
	       String title = rs.getString("title");
	       String content = rs.getString("content");
	       int readCount = rs.getInt("readcount");
	       String nal = rs.getString("nal");
	       
	       BoardNoticeDTO data = new BoardNoticeDTO();
	       data.setNo(no);
	       data.setAuthor(author);
	       data.setTitle(title);
	       data.setContent(content);
	       data.setReadcount(readCount);
	       data.setNal(nal);
	       list.add(data);     
	      }
	      pageTo.setList(list);//ArrayList 저장
	      pageTo.setTotalCount(totalCount);//전체레코드개수
	      pageTo.setCurPage(curPage);//현재페이지
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	     return pageTo;      
	    }//페이지구현
	
	public void noticeSqlInsert() {
		sql = "select max(no) as no from boardnotice";
	}
	
	public void noticeBunho() {
		try {
			noticeSqlInsert();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				cnt = rs.getInt("no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void noticeWrite(BoardNoticeDTO noticeDTO) {//글쓰기
		noticeBunho();
		noticeDTO.setNo(cnt+1);
		sql = "insert into boardnotice(no,title,content,author,nal,readcount) values(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeDTO.getNo());
			pstmt.setString(2, noticeDTO.getTitle());
			pstmt.setString(3, noticeDTO.getContent());
			pstmt.setString(4, noticeDTO.getAuthor());
			pstmt.setString(5, noticeDTO.getNal());
			pstmt.setInt(6, noticeDTO.getReadcount());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//글쓰기
	
	public ArrayList<BoardNoticeDTO> noticeSearch(BoardNoticeDTO noticeDTO,String choice){//검색
		try {
			if(choice.equals("A")) {
				sql = "select no,title,author,nal,readcount from boardnotice where visible=1 and (title like ? or author like ?) order by no";			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+noticeDTO.getTitle()+"%");
				pstmt.setString(2, "%"+noticeDTO.getAuthor()+"%");
			}
			else if(choice.equals("T")) {
				sql = "select no,title,author,nal,readcount from boardnotice where visible=1 and title like ? order by no";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+noticeDTO.getTitle()+"%");
			}
			else if(choice.equals("C")) {
				sql = "select no,title,author,nal,readcount from boardnotice where visible=1 and author like ? order by no";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+noticeDTO.getAuthor()+"%");
			}
			rs = pstmt.executeQuery();
			noticeList = new ArrayList<BoardNoticeDTO>();
			while(rs.next()) {
				noticeDTO = new BoardNoticeDTO();
				noticeDTO.setNo(rs.getInt("no"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setAuthor(rs.getString("author"));
				noticeDTO.setNal(rs.getString("nal"));
				noticeDTO.setReadcount(rs.getInt("readcount"));
				noticeList.add(noticeDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticeList;
	}//검색
	public BoardNoticeDTO noticeContent(BoardNoticeDTO noticeDTO) {//내용보기
		sql = "select no,title,content,author,nal,readcount from boardnotice where no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeDTO.getNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				noticeDTO = new BoardNoticeDTO();
				noticeDTO.setNo(rs.getInt("no"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setContent(rs.getString("content"));
				noticeDTO.setAuthor(rs.getString("author"));
				noticeDTO.setNal(rs.getString("nal"));
				noticeDTO.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticeDTO;
	
	}//내용보기
	
	public void noticeDelete(BoardNoticeDTO noticeDTO) {//삭제
		try {
			sql = "update boardnotice set visible=1 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//삭제
	
	public void noticeUpdate(BoardNoticeDTO noticeDTO) {//게시글수정
		try {
			sql = "update boardnotice set content=?,title=?,author=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeDTO.getContent());
			pstmt.setString(2, noticeDTO.getTitle());
			pstmt.setString(3, noticeDTO.getAuthor());
			pstmt.setInt(4, noticeDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//게시글수정
}
