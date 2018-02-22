package kr.co.daegu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	public DataSource dataFactory;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int cnt;
	private ArrayList<MemberDTO> memberList;

	public MemberDAO() {
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

	public void memberInsert(MemberDTO memberDTO) {// 회원가입
		try {
			sql = "insert into bookmember(id,pw,pwch,irum,tel,email,birth,memImage,emailcheck,smscheck) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPw());
			pstmt.setString(3, memberDTO.getPwch());
			pstmt.setString(4, memberDTO.getIrum());
			pstmt.setString(5, memberDTO.getTel());
			pstmt.setString(6, memberDTO.getEmail());
			pstmt.setString(7, memberDTO.getBirth());
			pstmt.setString(8, memberDTO.getMemImage());
			pstmt.setString(9, memberDTO.getEmailcheck());
			pstmt.setString(10, memberDTO.getSmscheck());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 회원가입

public boolean memberIdCheck(String id) {//id중복체크
	boolean idcheck=false;
	sql = "select id from bookmember where id=?";	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String getId = rs.getString("id");
			if (getId.equals(id)) {
				idcheck=true;
			}
		}
		//idcheck = rs.next();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return idcheck;
}//id중복체크

	public boolean memberLoginIdCheck(MemberDTO memberDTO) {// 로그인 할 때, 일치하는 아이디가 있을지 확인
		boolean loginIdCheck = false;
		sql = "select id from bookmember where id=? and visible=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				loginIdCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loginIdCheck;
	}// 로그인할 때,
	
	
	public boolean memberDeleteIdCheck(MemberDTO memberDTO) {// 탈퇴한 아이디 인지 아닌지
		boolean loginDeleteCheck = false;
		sql = "select id from bookmember where id=? and visible=0";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				loginDeleteCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loginDeleteCheck;
	}// 탈퇴한 아이디 인지 아닌지
	

	public boolean memberlogin(MemberDTO memberDTO) {// 로그인
		boolean login = false;
		sql = "select id,pw from bookmember where id=? and pw=? and visible=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPw());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				login = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return login;
	}// 로그인
	
	public MemberDTO adminNameGet(MemberDTO memberDTO) {//관리자 이름 가져오기
		
		sql="select irum from bookmember where id=? and visible=1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				memberDTO.setIrum(rs.getString("irum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberDTO;
		
	}//관리자 이름 가져오기
	

	public String memberPwSelect(MemberDTO memberDTO) {// 비번찾기
		String pw = null;
		sql = "select pw from bookmember where id=? and birth=? and visible=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getBirth());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pw = rs.getString("pw");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pw;
	}// 비번찾기

	public ArrayList<MemberDTO> memberList(MemberDTO memberDTO) {// 회원전체출력
		sql = "select id,irum,birth from bookmember where visible=1";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			memberList = new ArrayList<MemberDTO>();
			while (rs.next()) {
				memberDTO = new MemberDTO();
				String id = rs.getString("id");
				String irum = rs.getString("irum");
				String birth = rs.getString("birth");
				memberDTO.setId(id);
				memberDTO.setIrum(irum);
				memberDTO.setBirth(birth);
				memberList.add(memberDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;

	}// 회원전체출력

	public MemberDTO memberUpdateView(MemberDTO memberDTO) {// 멤버뷰

		sql = "select id,pw,pwch,irum,tel,email,birth,memImage,emailcheck,smscheck from bookmember where id=? and visible=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String pwch = rs.getString("pwch");
				String irum = rs.getString("irum");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String birth = rs.getString("birth");
				String memImage = rs.getString("memImage");
				String emailcheck = rs.getString("emailcheck");
				String smscheck = rs.getString("smscheck");

				memberDTO.setId(id);
				memberDTO.setPw(pw);
				memberDTO.setPwch(pwch);
				memberDTO.setIrum(irum);
				memberDTO.setTel(tel);
				memberDTO.setEmail(email);
				memberDTO.setBirth(birth);
				memberDTO.setMemImage(memImage);
				memberDTO.setEmailcheck(emailcheck);
				memberDTO.setSmscheck(smscheck);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// 멤버뷰

	public void memberUpdate(MemberDTO memberDTO) {// 멤버수정

		try {

			if (memberDTO.getMemImage().equals("")) {

				sql = "update bookmember set pw=?,pwch=?,irum=?,tel=?,email=?,emailcheck=?,smscheck=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberDTO.getPw());
				pstmt.setString(2, memberDTO.getPwch());
				pstmt.setString(3, memberDTO.getIrum());
				pstmt.setString(4, memberDTO.getTel());
				pstmt.setString(5, memberDTO.getEmail());
				pstmt.setString(6, memberDTO.getEmailcheck());
				pstmt.setString(7, memberDTO.getSmscheck());
				pstmt.setString(8, memberDTO.getId());
			} else {
				sql = "update bookmember set pw=?,pwch=?,irum=?,tel=?,email=?,memImage=?,emailcheck=?,smscheck=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberDTO.getPw());
				pstmt.setString(2, memberDTO.getPwch());
				pstmt.setString(3, memberDTO.getIrum());
				pstmt.setString(4, memberDTO.getTel());
				pstmt.setString(5, memberDTO.getEmail());
				pstmt.setString(6, memberDTO.getMemImage());
				pstmt.setString(7, memberDTO.getEmailcheck());
				pstmt.setString(8, memberDTO.getSmscheck());
				pstmt.setString(9, memberDTO.getId());
			}
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}// 멤버수정

	public void memberLeave(MemberDTO memberDTO) {// 멤버탈퇴
		sql = "update bookmember set visible=0 where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean memberIdview(MemberDTO memberDTO) {// 아이디가 일치하는지 아닌지
		boolean idcheck = false;

		try {
			sql = "select id from bookmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				idcheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idcheck;
	}// 아이디가 일치하는지 아닌지

	public MemberDTO memberProfile(MemberDTO memberDTO) {// 회원 프로필 사진

		sql = "select memImage from bookmember where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberDTO.setMemImage(rs.getString("memImage"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberDTO;

	}// 회원 프로필 사진
}
