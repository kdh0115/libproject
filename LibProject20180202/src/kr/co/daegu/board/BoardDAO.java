package kr.co.daegu.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardDAO {
	
	public DataSource dataFactory;
	private Connection conn;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<BoardDTO> boardList;
	private int cnt;
	
	public BoardDAO() {//생성자 시작

			try {
				Context ctx = new InitialContext();
				dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
				/*dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/kdh0115");*/
				conn=dataFactory.getConnection();
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}//생성자 끝
	
	public void boardClose() {
		try {
			conn.close();
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> boardList(BoardDTO boardDTO) {//info에 게시판 전체출력
		try {

			sql="select no,title,author,writedate,readcount from board order by no desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			boardList = new ArrayList<BoardDTO>();
			while(rs.next()) {
				boardDTO = new BoardDTO();
				
				boardDTO.setNo(rs.getInt("no"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setAuthor(rs.getString("author"));
				boardDTO.setWritedate(rs.getString("writedate"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				
				boardList.add(boardDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}//info에 게시판 전체출력
	
	public void boardSqlInsert() {
		sql = "select max(no) as no from board";
	}
	
	public void boardBunho() {//DB 게시글 번호
		try {
			boardSqlInsert();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) 
				cnt=rs.getInt("no");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//DB 게시글 번호
	
	public void boardWrite(BoardDTO boardDTO) {//글쓰기
		
		try {
			boardBunho();
			boardDTO.setNo(cnt+1);
			sql="insert into board(no,title,content,author,writedate,readcount) values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getNo());
			pstmt.setString(2, boardDTO.getTitle());
			pstmt.setString(3, boardDTO.getContent());
			pstmt.setString(4, boardDTO.getAuthor());
			pstmt.setString(5, boardDTO.getWritedate());
			pstmt.setInt(6, boardDTO.getReadcount());
			cnt=pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//글쓰기
	
	public ArrayList<BoardDTO> boardSearch(BoardDTO boardDTO, String setop) {//게시글 검색

	try {
			if(setop.equals("all")) {
				sql="select no,title,author,writedate,readcount from board where title like ? or author like ? order by no desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+boardDTO.getTitle()+"%");
				pstmt.setString(2, "%"+boardDTO.getAuthor()+"%");
			}
			else if(setop.equals("title")) {
				sql="select no,title,author,writedate,readcount from board where title like ? order by no desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+boardDTO.getTitle()+"%");
			} 
			else if(setop.equals("author")) {
				sql="select no,title,author,writedate,readcount from board where author like ? order by no desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+boardDTO.getAuthor()+"%");
			}

			rs=pstmt.executeQuery();
			
			boardList = new ArrayList<BoardDTO>();

			while(rs.next()) {
				boardDTO = new BoardDTO();
				
				boardDTO.setNo(rs.getInt("no"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setAuthor(rs.getString("author"));
				boardDTO.setWritedate(rs.getString("writedate"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				
				boardList.add(boardDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}//게시글 검색
	
	public BoardDTO boardContent(BoardDTO boardDTO){// 게시글 내용보기
		try {
			sql="select no,title,content,author,writedate,readcount from board where no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getNo());
			rs=pstmt.executeQuery();
			boardList = new ArrayList<BoardDTO>();
			while(rs.next()) {
				boardDTO = new BoardDTO();
				
				boardDTO.setNo(rs.getInt("no"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setAuthor(rs.getString("author"));
				boardDTO.setWritedate(rs.getString("writedate"));
				boardDTO.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardDTO;
	}// 게시글 내용보기
	
	public void boardDelete(BoardDTO boardDTO) {//게시글 삭제
		
		try {
			sql="delete from board where no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getNo());
			cnt=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//게시글 삭제
	
	public void boardUpdate(BoardDTO boardDTO) {//게시글 수정
		
		try {
			sql="update board set title=?, content=?, author=?, writedate=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getTitle());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setString(3, boardDTO.getAuthor());
			pstmt.setInt(4, boardDTO.getNo());
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//게시글 수정
	
	public void boardReadCount(BoardDTO boardDTO) {//조회수
		
		try {
			sql="update board set readcount=? where no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getReadcount()+1);
			pstmt.setInt(2, boardDTO.getNo());
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//조회수
	
}
