package kr.co.daegu.boardQA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardQADAO {
	
	public DataSource dataFactory;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<BoardQADTO> qaList;
	private int cnt;

	public BoardQADAO() {
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

	public ArrayList<BoardQADTO> qaList(BoardQADTO qaDTO) {// 전체출력
		try {
			sql = "select no,title,nal,author,readcount from boardqa where visible=1 order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			qaList = new ArrayList<BoardQADTO>();
			while (rs.next()) {
				qaDTO = new BoardQADTO();
				qaDTO.setNo(rs.getInt("no"));
				qaDTO.setTitle(rs.getString("title"));
				qaDTO.setNal(rs.getString("nal"));
				qaDTO.setAuthor(rs.getString("author"));
				qaDTO.setReadcount(rs.getInt("readcount"));
				qaList.add(qaDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qaList;
	}// 전체출력

	public void qaReadCount(BoardQADTO qaDTO) {// 조회수증가
		try {
			sql = "update boardqa set readcount=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaDTO.getReadcount() + 1);
			pstmt.setInt(2, qaDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 조회수증가

	public int totalCount() {// 페이징처리: 전체레코드 개수 구하기
		int count = 0;
		try {
			sql = "select count(*) from boardqa where visible=1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}// 페이징처리: 전체레코드 개수 구하기

	public PageToQA page(int curPage) {// 페이지구현
		PageToQA pageTo = new PageToQA();
		int totalCount = totalCount();
		ArrayList<BoardQADTO> list = new ArrayList<BoardQADTO>();
		try {
			sql = "select no,title,author,content,nal,readcount from boardqa where visible=1 order by no desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// TYPE_SCROLL_INSENSITIVE:scroll은 가능하나, 변경된 사항은 적용되지 않음
			// 양방향, 스크롤 시 업데이트 반영안함
			// CONCUR_READ_ONLY :커서의 위치에서 정보 업데이트 불가,ResultSet의 변경이 불가능
			rs = pstmt.executeQuery();
			int perPage = pageTo.getPerPage();// 5
			int skip = (curPage - 1) * perPage;
			if (skip > 0) {
				rs.absolute(skip);
			}
			// ResultSet의 absolute메소드를 이용하여 해당 페이지의 Cursor 의 위치로 이동...
			for (int i = 0; i < perPage && rs.next(); i++) {
				int no = rs.getInt("no");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int readCount = rs.getInt("readcount");
				String nal = rs.getString("nal");

				BoardQADTO data = new BoardQADTO();
				data.setNo(no);
				data.setAuthor(author);
				data.setTitle(title);
				data.setContent(content);
				data.setReadcount(readCount);
				data.setNal(nal);
				list.add(data);
			}
			pageTo.setList(list);// ArrayList 저장
			pageTo.setTotalCount(totalCount);// 전체레코드개수
			pageTo.setCurPage(curPage);// 현재페이지
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pageTo;
	}// 페이지구현

	public void noticeSqlInsert() {
		sql = "select max(no) as no from boardqa";
	}

	public void noticeBunho() {
		try {
			noticeSqlInsert();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				cnt = rs.getInt("no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void qaWrite(BoardQADTO qaDTO) {// 글쓰기
		noticeBunho();
		qaDTO.setNo(cnt + 1);
		sql = "insert into boardqa(no,title,content,author,nal,readcount) values(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaDTO.getNo());
			pstmt.setString(2, qaDTO.getTitle());
			pstmt.setString(3, qaDTO.getContent());
			pstmt.setString(4, qaDTO.getAuthor());
			pstmt.setString(5, qaDTO.getNal());
			pstmt.setInt(6, qaDTO.getReadcount());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 글쓰기

	public ArrayList<BoardQADTO> qaSearch(BoardQADTO qaDTO, String choice) {// 검색
		try {
			if (choice.equals("A")) {
				sql = "select no,title,author,nal,readcount from boardqa where visible=1 and (title like ? or author like ?) order by no";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qaDTO.getTitle() + "%");
				pstmt.setString(2, "%" + qaDTO.getAuthor() + "%");
			} else if (choice.equals("T")) {
				sql = "select no,title,author,nal,readcount from boardqa where visible=1 and title like ? order by no";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qaDTO.getTitle() + "%");
			} else if (choice.equals("C")) {
				sql = "select no,title,author,nal,readcount from boardqa where visible=1 and author like ? order by no";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qaDTO.getAuthor() + "%");
			}
			rs = pstmt.executeQuery();
			qaList = new ArrayList<BoardQADTO>();
			while (rs.next()) {
				qaDTO = new BoardQADTO();
				qaDTO.setNo(rs.getInt("no"));
				qaDTO.setTitle(rs.getString("title"));
				qaDTO.setAuthor(rs.getString("author"));
				qaDTO.setNal(rs.getString("nal"));
				qaDTO.setReadcount(rs.getInt("readcount"));
				qaList.add(qaDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qaList;
	}// 검색

	public BoardQADTO qaContent(BoardQADTO qaDTO) {// 내용보기
		sql = "select no,title,content,author,nal,readcount from boardqa where no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaDTO.getNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				qaDTO = new BoardQADTO();
				qaDTO.setNo(rs.getInt("no"));
				qaDTO.setTitle(rs.getString("title"));
				qaDTO.setContent(rs.getString("content"));
				qaDTO.setAuthor(rs.getString("author"));
				qaDTO.setNal(rs.getString("nal"));
				qaDTO.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qaDTO;

	}// 내용보기

	public void qaDelete(BoardQADTO qaDTO) {// 삭제
		try {
			sql = "update boardqa set visible=1 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 삭제

	public void qaUpdate(BoardQADTO qaDTO) {// 게시글수정
		try {
			sql = "update boardqa set content=?,title=?,author=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qaDTO.getContent());
			pstmt.setString(2, qaDTO.getTitle());
			pstmt.setString(3, qaDTO.getAuthor());
			pstmt.setInt(4, qaDTO.getNo());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 게시글수정
}
