package kr.co.daegu.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDAO {

	public DataSource dataFactory;
	private Connection conn;
	private String sql;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<BookDTO> bookList;
	private int cnt;

	public BookDAO() {// 생성자 시작
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
	}// 생성자 끝

	public ArrayList<BookDTO> infoList(BookDTO infoDTO) {// info에 인기도서 출력
		try {

			sql = "select no,title,icon,publishing,author,registNum from book order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			bookList = new ArrayList<BookDTO>();
			while (rs.next()) {
				infoDTO = new BookDTO();
				infoDTO.setNo(rs.getInt("no"));
				infoDTO.setTitle(rs.getString("title"));
				infoDTO.setIcon(rs.getString("icon"));
				infoDTO.setPublishing(rs.getString("publishing"));
				infoDTO.setAuthor(rs.getString("author"));
				infoDTO.setRegistNum(rs.getString("registNum"));

				bookList.add(infoDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}// info에 인기도서 출력

	public void bookSqlInsert() {
		sql = "select max(no) as no from book";
	}

	public int bookBunho() {// DB 도서번호
		try {
			bookSqlInsert();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
				cnt = rs.getInt("no");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt + 1;
	}// DB 도서번호

	public String bookRegistNum(int a) {// 등록번호

		// a는 DB에서 받아온 no
		String str[] = { "0", "0", "0", "0", "0", "M" };// 숫자를 String 저장할 공간

		int j = 0;// no의 자리 수를 저장하기 위한 변수

		while (a != 0) {
			str[j] = String.valueOf(a % 10);// int형을 String형으로 변형
			a /= 10;
			j++;
		}

		String arr = str[j - 1];

		for (int k = j - 2; k >= 0; k--) {
			arr = arr.concat(str[k]);
		}

		if (j == 5) {
			arr = str[5].concat(arr);
		} else if (j == 4) {
			arr = str[5].concat("0" + arr);
		} else if (j == 3) {
			arr = str[5].concat("00" + arr);
		} else if (j == 2) {
			arr = str[5].concat("000" + arr);
		} else if (j == 1) {
			arr = str[5].concat("0000" + arr);
		}

		System.out.println("arr : " + arr);
		return arr;
	}// 등록번호

	public int bookInsert(BookDTO bookDTO) {// 도서등록

		try {
			cnt = bookBunho();
			bookDTO.setRegistNum(bookRegistNum(cnt));
			bookDTO.setNo(cnt);
			sql = "insert into book(no,title,sutitle,author,icon,publisher,publishing,bookPage,bookInf,authorInf,tableOfCon,tableOfConTwo,inBook,publishReview,registNum) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookDTO.getNo());
			pstmt.setString(2, bookDTO.getTitle());
			pstmt.setString(3, bookDTO.getSutitle());
			pstmt.setString(4, bookDTO.getAuthor());
			pstmt.setString(5, bookDTO.getIcon());
			pstmt.setString(6, bookDTO.getPublisher());
			pstmt.setString(7, bookDTO.getPublishing());
			pstmt.setInt(8, bookDTO.getBookPage());
			pstmt.setString(9, bookDTO.getBookInf());
			pstmt.setString(10, bookDTO.getAuthorInf());
			pstmt.setString(11, bookDTO.getTableOfCon());
			pstmt.setString(12, bookDTO.getTableOfConTwo());
			pstmt.setString(13, bookDTO.getInBook());
			pstmt.setString(14, bookDTO.getPublishReview());
			pstmt.setString(15, bookDTO.getRegistNum());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}// 도서등록

	public int bookDelete(BookDTO bookDTO) {// 도서삭제
		try {
			// sql="delete from book where title=? and author=?";
			sql = "update book set state=?, bookExistence=0 where title=? and author=? and bookExistence=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "대출불가능");
			pstmt.setString(2, bookDTO.getTitle());
			pstmt.setString(3, bookDTO.getAuthor());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;

	}// 도서삭제

	public int bookUpdate(BookDTO bookDTO) {// 도서 수정
		// 도서 실제 수정

		try {
			if (bookDTO.getIcon().equals("")) {// 도서 이미지를 변경하지 않았을 때

				sql = "update book set title=?,sutitle=?,author=?,publisher=?,publishing=?,bookPage=?,bookInf=?,authorInf=?,tableOfCon=?,tableOfConTwo=?,inBook=?,publishReview=? where registNum=? and bookExistence=1";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookDTO.getTitle());
				pstmt.setString(2, bookDTO.getSutitle());
				pstmt.setString(3, bookDTO.getAuthor());
				pstmt.setString(4, bookDTO.getPublisher());
				pstmt.setString(5, bookDTO.getPublishing());
				pstmt.setInt(6, bookDTO.getBookPage());
				pstmt.setString(7, bookDTO.getBookInf());
				pstmt.setString(8, bookDTO.getAuthorInf());
				pstmt.setString(9, bookDTO.getTableOfCon());
				pstmt.setString(10, bookDTO.getTableOfConTwo());
				pstmt.setString(11, bookDTO.getInBook());
				pstmt.setString(12, bookDTO.getPublishReview());
				pstmt.setString(13, bookDTO.getRegistNum());
			} else {// 도서 이미지를 변경했을 때
				sql = "update book set title=?,sutitle=?,author=?,icon=?,publisher=?,publishing=?,bookPage=?,bookInf=?,authorInf=?,tableOfCon=?,tableOfConTwo=?,inBook=?,publishReview=? where registNum=? and bookExistence=1";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bookDTO.getTitle());
				pstmt.setString(2, bookDTO.getSutitle());
				pstmt.setString(3, bookDTO.getAuthor());
				pstmt.setString(4, bookDTO.getIcon());
				pstmt.setString(5, bookDTO.getPublisher());
				pstmt.setString(6, bookDTO.getPublishing());
				pstmt.setInt(7, bookDTO.getBookPage());
				pstmt.setString(8, bookDTO.getBookInf());
				pstmt.setString(9, bookDTO.getAuthorInf());
				pstmt.setString(10, bookDTO.getTableOfCon());
				pstmt.setString(11, bookDTO.getTableOfConTwo());
				pstmt.setString(12, bookDTO.getInBook());
				pstmt.setString(13, bookDTO.getPublishReview());
				pstmt.setString(14, bookDTO.getRegistNum());

			}
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}// 도서수정

	public BookDTO bookBest(BookDTO bookDTO) {// 자료검색 - 인기도서, 베스트셀러 상세정보

		String sql = "select title,sutitle,author,icon,publisher,publishing,bookPage,bookInf,authorInf,tableOfCon,tableOfConTwo,inBook,publishReview,registNum from book where title like ? and bookExistence=1";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + bookDTO.getTitle() + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bookDTO.setTitle(rs.getString("title"));
				bookDTO.setSutitle(rs.getString("sutitle"));
				bookDTO.setAuthor(rs.getString("author"));
				bookDTO.setIcon(rs.getString("icon"));
				bookDTO.setPublisher(rs.getString("publisher"));
				bookDTO.setPublishing(rs.getString("publishing"));
				bookDTO.setBookPage(rs.getInt("bookPage"));
				bookDTO.setBookInf(rs.getString("bookInf"));
				bookDTO.setAuthorInf(rs.getString("authorInf"));
				bookDTO.setTableOfCon(rs.getString("tableOfCon"));
				bookDTO.setTableOfConTwo(rs.getString("tableOfConTwo"));
				bookDTO.setInBook(rs.getString("inBook"));
				bookDTO.setPublishReview(rs.getString("publishReview"));
				bookDTO.setRegistNum(rs.getString("registNum"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookDTO;
	}// 자료검색 - 인기도서, 베스트셀러 상세정보

	public BookDTO bookConfirm(BookDTO bookDTO) {// 도서수정 - DB에 저장되어 있는 도서 정보 가져오기

		String sql = "select registNum,title,sutitle,author,icon,publisher,publishing,bookPage,bookInf,authorInf,tableOfCon,tableOfConTwo,inBook,publishReview from book where title=? and author=? and bookExistence=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookDTO.getTitle());
			pstmt.setString(2, bookDTO.getAuthor());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bookDTO.setRegistNum(rs.getString("registNum"));
				bookDTO.setTitle(rs.getString("title"));
				bookDTO.setSutitle(rs.getString("sutitle"));
				bookDTO.setAuthor(rs.getString("author"));
				bookDTO.setIcon(rs.getString("icon"));
				bookDTO.setPublisher(rs.getString("publisher"));
				bookDTO.setPublishing(rs.getString("publishing"));
				bookDTO.setBookPage(rs.getInt("bookPage"));
				bookDTO.setBookInf(rs.getString("bookInf"));
				bookDTO.setAuthorInf(rs.getString("authorInf"));
				bookDTO.setTableOfCon(rs.getString("tableOfCon"));
				bookDTO.setTableOfConTwo(rs.getString("tableOfConTwo"));
				bookDTO.setInBook(rs.getString("inBook"));
				bookDTO.setPublishReview(rs.getString("publishReview"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookDTO;
	}// 도서수정 - DB에 저장되어 있는 도서 정보 가져오기

	public ArrayList<BookDTO> bookSearch(BookDTO bookDTO, String setop) {// 도서 검색

		try {

			/* setop에 실려오는 값 : title, author, titleNauthor */
			// 출력 : 등록번호, 도서명, 저자, 도서이미지, 출판연도, 도서상태
			if (setop.equals("all")) {
				sql = "select registNum,title,author,icon,publishing,state from book where title like ? or author like ? order by registNum";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + bookDTO.getTitle() + "%");
				pstmt.setString(2, "%" + bookDTO.getAuthor() + "%");
			} else if (setop.equals("title")) {
				sql = "select registNum,title,author,icon,publishing,state from book where title like ? order by registNum";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + bookDTO.getTitle() + "%");
			} else if (setop.equals("author")) {
				sql = "select registNum,title,author,icon,publishing,state from book where author like ? order by registNum";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + bookDTO.getAuthor() + "%");
			} else if (setop.equals("titleNauthor")) {
				sql = "select registNum,title,author,icon,publishing,state from book where title like ? or author like ? order by registNum";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + bookDTO.getTitle() + "%");
				pstmt.setString(2, "%" + bookDTO.getAuthor() + "%");
			}

			rs = pstmt.executeQuery();

			bookList = new ArrayList<BookDTO>();

			while (rs.next()) {

				bookDTO = new BookDTO();
				// 출력 : 등록번호, 도서명, 저자, 도서이미지, 출판연도, 도서상태
				bookDTO.setRegistNum(rs.getString("registNum"));
				bookDTO.setTitle(rs.getString("title"));
				bookDTO.setAuthor(rs.getString("author"));
				bookDTO.setIcon(rs.getString("icon"));
				bookDTO.setPublishing(rs.getString("publishing"));
				bookDTO.setState(rs.getString("state"));

				bookList.add(bookDTO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookList;
	}// 도서검색 끝

	public ArrayList<BookDTO> bookList(BookDTO bookDTO) {// 책전체출력
		try {
			sql = "select registNum,title,author,icon,publishing,publisher,bookPage,state from book order by registNum";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			bookList = new ArrayList<BookDTO>();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setRegistNum(rs.getString("registNum"));
				bookDTO.setTitle(rs.getString("title"));
				bookDTO.setAuthor(rs.getString("author"));
				bookDTO.setIcon(rs.getString("icon"));
				bookDTO.setPublishing(rs.getString("publishing"));
				bookDTO.setPublisher(rs.getString("publisher"));
				bookDTO.setBookPage(rs.getInt("bookPage"));
				bookDTO.setState(rs.getString("state"));

				bookList.add(bookDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}// 책전체출력

	public boolean borrowBookCheck(String registNum) {// 책이 있는지 확인, 파라미터는 등록번호

		sql = "select registNum from book where registNum=?";
		boolean check = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, registNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return check;

	}// 책이 있는지 확인

	public boolean borrowBookState(String registNum) { // 대출가능인지 확인

		sql = "select state from book where registNum=?";

		boolean bookstate = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, registNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				if (rs.getString("state").equals("대출가능")) {
					bookstate = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bookstate;
	}// 대출가능인지 확인

	public void bookStateUpdate(String registNum) {// 책 상태 대출중으로 변경
		try {
			sql = "update book set state=? where registNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "대출중");
			pstmt.setString(2, registNum);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 책 상태 대출중으로 변경

	public void bookStatePossibleUpdate(String registNum) {// 책 상태 대출가능으로 변경
		try {
			sql = "update book set state=? where registNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "대출가능");
			pstmt.setString(2, registNum);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 책 상태 대출가능으로 변경

}
