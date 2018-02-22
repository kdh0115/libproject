package kr.co.daegu.borrow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BorrowDAO {
	public DataSource dataFactory;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	private ArrayList<BorrowDTO> borrowList;

	public BorrowDAO() {
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

	public void borrowInsert(BorrowDTO borrowDTO) {// 대출등록
		try {
			/*sql = "insert into lend(registNum,id) values(?,?)";*/
			sql = "insert into lend(givedate,takedate,registNum,id) values(now(),now()+7,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, borrowDTO.getRegistNum());
			pstmt.setString(2, borrowDTO.getId());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 대출등록

	public void borrowRetrun(BorrowDTO borrowDTO) {// 도서 반납
		try {
			/*sql = "update lend set returndate=sysdate, returnCheck=? where registnum=?";*/
			sql = "update lend set returndate=now(), returnCheck=? where registnum=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, borrowDTO.getRegistNum());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 도서 반납

	// 수정
	public ArrayList<BorrowDTO> borrowView(BorrowDTO borrowDTO) { // 회원 - 대출현황
		borrowList = new ArrayList<BorrowDTO>();
		// sql = "select givedate,takedate,delaydate,registNum from lend where id=?";

		sql = "select b.title as title, b.author as author, l.registNum as registNum, l.givedate as givedate,"
				+ " l.takedate as takedate, l.extension as extension "
				+ "from lend l right join book b on l.registNum=b.registNum " + "where l.id=? and l.returnCheck=0 "
				+ "order by l.givedate desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, borrowDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				borrowDTO = new BorrowDTO();
				borrowDTO.setTitle(rs.getString("title"));
				borrowDTO.setAuthor(rs.getString("author"));
				borrowDTO.setRegistNum(rs.getString("registNum"));
				borrowDTO.setGivedate(rs.getString("givedate"));
				borrowDTO.setTakedate(rs.getString("takedate"));
				borrowDTO.setExtension(rs.getInt("extension"));

				borrowList.add(borrowDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return borrowList;
	}// 회원 - 대출현황

	public ArrayList<BorrowDTO> borrowAllView(BorrowDTO borrowDTO) { // 회원 - 전체대출기록
		borrowList = new ArrayList<BorrowDTO>();

		sql = "select b.title as title, b.author as author, l.registNum as registNum, l.givedate as givedate, l.returndate as returndate, l.delaydate as delaydate from lend l right join book b on l.registNum=b.registNum	where l.id=? and l.returnCheck=1 order by l.givedate desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, borrowDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				borrowDTO = new BorrowDTO();
				borrowDTO.setTitle(rs.getString("title"));
				borrowDTO.setAuthor(rs.getString("author"));
				borrowDTO.setRegistNum(rs.getString("registNum"));
				borrowDTO.setGivedate(rs.getString("givedate"));
				borrowDTO.setReturndate(rs.getString("returndate"));
				borrowDTO.setDelaydate(rs.getInt("delaydate"));

				borrowList.add(borrowDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return borrowList;
	}// 회원 - 전체대출기록

}