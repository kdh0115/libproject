package kr.co.daegu.boardLF;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("*.lf")
/*@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "C:\\Develop\\workspacejsp\\LibProject20180123\\WebContent\\images\\boardLost")*/
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "/home/hosting_users/kdh0115/tomcat/webapps/ROOT/images/boardLost")
public class BoardLfFrontCotroller extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardLfDAO lfDAO;
	private BoardLfDTO lfDTO;
	private ArrayList<BoardLfDTO> lfList;

	public BoardLfFrontCotroller() {
		lfDAO = new BoardLfDAO();
		lfDTO = new BoardLfDTO();
	}

	private String getFilename(Part part) {
		String fileName = null;
		String contentDispositionHeader = part.getHeader("content-disposition");
		String[] elements = contentDispositionHeader.split(";");
		for (String element : elements) {
			if (element.trim().startsWith("filename")) {
				fileName = element.substring(element.indexOf('=') + 1);
				fileName = fileName.trim().replace("\"", "");
			}
		}
		return fileName;
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

		if (command.equals("/lfList.lf")) {// 분실물 게시판 들어갔을 때 전체출력
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageToLF list = lfDAO.page(curPage);
			RequestDispatcher dis = request.getRequestDispatcher("boardLostAndFound.jsp");
			request.setAttribute("page", list);
			request.setAttribute("list", list.getList());
			dis.forward(request, response);
		} // 전체출력

		else if (command.equals("/lfWrite.lf")) {// 글쓰기

			String content = request.getParameter("content");
			String author = request.getParameter("author");
			String nal = request.getParameter("nal");
			String place = request.getParameter("place");

			Part part = request.getPart("theFile");
			String fileName = getFilename(part);

			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
			}

			lfDTO.setIcon(fileName);
			lfDTO.setContent(content);
			lfDTO.setAuthor(author);
			lfDTO.setNal(nal);
			lfDTO.setPlace(place);
			lfDAO.lfWrite(lfDTO);
			lfList = lfDAO.lfList(lfDTO);
			response.sendRedirect("lfList.lf");
		} // 글쓰기

		else if (command.equals("/lfSearch.lf")) {// 글검색

			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageToLF list = lfDAO.page(curPage);
			String choice = request.getParameter("choice");
			String search = request.getParameter("search");
			String option = null;
			if (choice.equals("T")) {
				lfDTO.setIcon(search);
				option = "제목";
			} else if (choice.equals("C")) {
				lfDTO.setAuthor(search);
				option = "작성자";
			}
			lfList = lfDAO.lfSearch(lfDTO, choice);
			RequestDispatcher dis = request.getRequestDispatcher("boardLostAndFound.jsp");
			request.setAttribute("list", lfList);
			request.setAttribute("page", list);
			dis.forward(request, response);
		} // 글검색

		else if (command.equals("/lfDelete.lf")) {// 글 삭제
			String no = request.getParameter("no");
			lfDTO.setNo(Integer.parseInt(no));
			lfDAO.lfDelete(lfDTO);
			response.sendRedirect("lfList.lf");
		} // 글 삭제

		else if (command.equals("/lfUpdate.lf")) {// 게시글 수정
			String no = request.getParameter("no");
			String icon = request.getParameter("icon");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			lfDTO.setNo(Integer.parseInt(no));
			lfDTO.setIcon(icon);
			lfDTO.setAuthor(author);
			lfDTO.setContent(content);
			lfDAO.lfUpdate(lfDTO);
			response.sendRedirect("lfList.lf");
		} // 게시글수정

		else if (command.equals("/lfContent.lf")) {// 게시글 내용
			String no = request.getParameter("no");
			lfDTO.setNo(Integer.parseInt(no));
			lfDTO = lfDAO.lfContent(lfDTO);
			RequestDispatcher dis = request.getRequestDispatcher("lfContent.jsp");
			request.setAttribute("lfDTO", lfDTO);
			dis.forward(request, response);
		} // 게시글 내용
	}
}
