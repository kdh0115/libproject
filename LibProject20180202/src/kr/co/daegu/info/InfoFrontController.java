package kr.co.daegu.info;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.daegu.board.BoardDAO;
import kr.co.daegu.board.BoardDTO;
import kr.co.daegu.book.BookDAO;
import kr.co.daegu.book.BookDTO;

@WebServlet("*.info")
public class InfoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookDTO bookDTO;
	private BookDAO bookDAO;
	private BoardDTO boardDTO;
	private BoardDAO boardDAO;
	private ArrayList<BoardDTO> boardList;
	private ArrayList<BookDTO> bookList;

	public InfoFrontController() {
		bookDTO = new BookDTO();
		bookDAO = new BookDAO();
		boardDTO = new BoardDTO();
		boardDAO = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/boardNbook.info")) {// 메인 게시판, 책정보 출력

			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?page=info");

			bookList = bookDAO.infoList(bookDTO);
			request.setAttribute("infoList", bookList);

			boardList = boardDAO.boardList(boardDTO);
			request.setAttribute("boardList", boardList);

			dispatcher.forward(request, response);
		} // 메인 게시판, 책정보 출력

	}

}
