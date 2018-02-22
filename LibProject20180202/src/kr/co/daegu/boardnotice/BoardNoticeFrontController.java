package kr.co.daegu.boardnotice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.notice")
public class BoardNoticeFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardNoticeDAO noticeDAO;
	private BoardNoticeDTO noticeDTO;
	private ArrayList<BoardNoticeDTO> noticeList;

	public BoardNoticeFrontController() {
		noticeDAO = new BoardNoticeDAO();
		noticeDTO = new BoardNoticeDTO();
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

		if (command.equals("/noticeList.notice")) {// 전체출력
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo list = noticeDAO.page(curPage);
			RequestDispatcher dis = request.getRequestDispatcher("boardNotice.jsp");
			request.setAttribute("page", list);
			request.setAttribute("list", list.getList());
			dis.forward(request, response);
		} // 전체출력

		else if (command.equals("/noticeWrite.notice")) {// 글쓰기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String author = request.getParameter("author");
			String nal = request.getParameter("nal");
			noticeDTO.setTitle(title);
			noticeDTO.setContent(content);
			noticeDTO.setAuthor(author);
			noticeDTO.setNal(nal);
			noticeDTO.setReadcount(0);
			noticeDAO.noticeWrite(noticeDTO);
			noticeList = noticeDAO.noticeList(noticeDTO);
			response.sendRedirect("noticeList.notice");
		} // 글쓰기

		else if (command.equals("/noticeSearch.notice")) {// 글검색

			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageTo list = noticeDAO.page(curPage);
			String choice = request.getParameter("choice");
			String search = request.getParameter("search");
			String option = null;
			if (choice.equals("A")) {//전체
				noticeDTO.setTitle(search);
				noticeDTO.setAuthor(search);
				option = "제목+작성자";
			} else if (choice.equals("T")) {//제목
				noticeDTO.setTitle(search);
				option = "제목";
			} else if (choice.equals("C")) {//작성자
				noticeDTO.setAuthor(search);
				option = "작성자";
			}
			noticeList = noticeDAO.noticeSearch(noticeDTO, choice);
			RequestDispatcher dis = request.getRequestDispatcher("boardNotice.jsp");
			request.setAttribute("list", noticeList);
			request.setAttribute("page", list);

			dis.forward(request, response);
		} // 글검색
		
		else if (command.equals("/noticeDelete.notice")) {// 글 삭제
			String no = request.getParameter("no");
			noticeDTO.setNo(Integer.parseInt(no));
			noticeDAO.noticeDelete(noticeDTO);
			response.sendRedirect("noticeList.notice");
		} // 글 삭제

		else if (command.equals("/noticeUpdate.notice")) {// 게시글 수정
			String no = request.getParameter("no");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			noticeDTO.setNo(Integer.parseInt(no));
			noticeDTO.setTitle(title);
			noticeDTO.setAuthor(author);
			noticeDTO.setContent(content);
			noticeDAO.noticeUpdate(noticeDTO);
			response.sendRedirect("noticeList.notice");
		} // 게시글수정
		
		else if (command.equals("/noticeContent.notice")) {// 게시글 내용
			String no = request.getParameter("no");
			noticeDTO.setNo(Integer.parseInt(no));
			noticeDTO = noticeDAO.noticeContent(noticeDTO);
			noticeDAO.noticeReadCount(noticeDTO);
			RequestDispatcher dis = request.getRequestDispatcher("noticeContent.jsp");
			request.setAttribute("noticeDTO", noticeDTO);
			dis.forward(request, response);
		} // 게시글 내용
	}

}
