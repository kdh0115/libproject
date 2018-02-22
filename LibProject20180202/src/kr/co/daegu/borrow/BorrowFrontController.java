package kr.co.daegu.borrow;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.daegu.book.BookDAO;
import kr.co.daegu.book.BookDTO;
import kr.co.daegu.member.MemberDAO;
import kr.co.daegu.member.MemberDTO;

@WebServlet("*.borrow")
public class BorrowFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BorrowDTO borrowDTO;
	public BorrowDAO borrowDAO;
	public BookDAO bookDAO;
	public BookDTO bookDTO;
	public MemberDAO memberDAO;
	public MemberDTO memberDTO;
	private ArrayList<BorrowDTO> borrowList;

	public BorrowFrontController() {
		borrowDTO = new BorrowDTO();
		borrowDAO = new BorrowDAO();
		bookDTO = new BookDTO();
		bookDAO = new BookDAO();
		memberDTO = new MemberDTO();
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/register.borrow")) {// 대출 등록

			String registNum = request.getParameter("registernum");
			String id = request.getParameter("id");
			boolean check = bookDAO.borrowBookCheck(registNum);// 책이 있는지 확인
			boolean bookstate = bookDAO.borrowBookState(registNum);// 대출중인지 아닌지 확인

			if (check == true && bookstate == true) {// 책이 있고, 대출가능 일 때
				borrowDTO.setRegistNum(registNum);
				borrowDTO.setId(id);
				borrowDAO.borrowInsert(borrowDTO); // 도서대출등록, id와 등록번호가 필요함
				bookDAO.bookStateUpdate(registNum);// 도서상태변경
				out.print("대출완료");
				out.print("<a href='index.jsp'>메인으로</a>");

			} else if (check == false) {// 등록번호와 일치한 책이 없을 때
				RequestDispatcher dis = request.getRequestDispatcher("borrow.jsp");
				memberDTO.setId(id);
				request.setAttribute("check", check);
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);

			} else if (bookstate == false) {// 도서가 대출 중
				RequestDispatcher dis = request.getRequestDispatcher("borrow.jsp");
				memberDTO.setId(id);
				request.setAttribute("bookstate", bookstate);
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			}

		} // 대출 등록

		if (command.equals("/retrun.borrow")) {// 대출 반납
			String registNum = request.getParameter("registernum");
			boolean check = bookDAO.borrowBookCheck(registNum);// 책이 있는지 확인
			boolean bookstate = bookDAO.borrowBookState(registNum);// 대출중인지 아닌지 확인

			if (check == true && bookstate == false) { // 도서가 존재하고, 대출 중
				borrowDTO.setRegistNum(registNum);
				borrowDAO.borrowRetrun(borrowDTO);// 도서반납
				bookDAO.bookStatePossibleUpdate(registNum);// 도서 대출가능으로 상태변경
				out.print("반납완료");
				out.print("<a href='index.jsp'>메인으로</a>");

			} else if (check == false) {// 등록번호와 일치한 책이 없을 때
				RequestDispatcher dis = request.getRequestDispatcher("borrowRetrun.jsp");
				request.setAttribute("check", check);
				dis.forward(request, response);

			} else if (bookstate == true) {// 도서가 대출가능
				RequestDispatcher dis = request.getRequestDispatcher("borrowRetrun.jsp");
				request.setAttribute("bookstate", bookstate);
				dis.forward(request, response);
			}

		} // 대출반납

		else if (command.equals("/list.borrow")) {// 회원이 보는 대출현황
			HttpSession session = request.getSession(false);
			String id = (String) session.getAttribute("id");
			borrowDTO.setId(id);
			borrowList = borrowDAO.borrowView(borrowDTO);
			RequestDispatcher dis = request.getRequestDispatcher("bookBorrow.jsp");
			request.setAttribute("borrowList", borrowList);
			dis.forward(request, response);
		} // 회원이 보는 대출현황

		else if (command.equals("/allList.borrow")) {// 회원 - 전체대출기록
			HttpSession session = request.getSession(false);
			String id = (String) session.getAttribute("id");
			borrowDTO.setId(id);
			borrowList = borrowDAO.borrowAllView(borrowDTO);
			RequestDispatcher dis = request.getRequestDispatcher("bookAllBorrow.jsp");
			request.setAttribute("borrowList", borrowList);
			dis.forward(request, response);
		} // 회원-전체대출기록

	}

}
