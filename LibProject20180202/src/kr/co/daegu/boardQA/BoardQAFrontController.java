package kr.co.daegu.boardQA;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.qa")
public class BoardQAFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardQADAO qaDAO;
	private BoardQADTO qaDTO;
	private ArrayList<BoardQADTO> qaList;
	
	public BoardQAFrontController() {
		qaDAO = new BoardQADAO();
		qaDTO = new BoardQADTO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("/qaList.qa")) {//전체출력
			int curPage = 1;
			if(request.getParameter("curPage")!=null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageToQA list=qaDAO.page(curPage);
			RequestDispatcher dis = request.getRequestDispatcher("boardQA.jsp");
			request.setAttribute("page", list);
			request.setAttribute("list", list.getList());
			dis.forward(request, response);
		}//전체출력
		else if(command.equals("/qaWrite.qa")) {//글쓰기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String author = request.getParameter("author");
			String nal = request.getParameter("nal");
			qaDTO.setTitle(title);
			qaDTO.setContent(content);
			qaDTO.setAuthor(author);
			qaDTO.setNal(nal);
			qaDTO.setReadcount(0);
			qaDAO.qaWrite(qaDTO);
			qaList = qaDAO.qaList(qaDTO);
			response.sendRedirect("qaList.qa");			
		}//글쓰기
		else if(command.equals("/qaSearch.qa")) {//글검색
			
			int curPage = 1;
			if(request.getParameter("curPage")!=null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			PageToQA list=qaDAO.page(curPage);
			String choice=request.getParameter("choice");
			String  search=request.getParameter("search");
			String option = null;
			if(choice.equals("A")) {
				qaDTO.setTitle(search);
				qaDTO.setAuthor(search);
				option="제목+작성자";
			}
			else if(choice.equals("T")) {
				qaDTO.setTitle(search);
				option="제목";
			}else if(choice.equals("C")) {
				qaDTO.setAuthor(search);
				option="작성자";
			}
			qaList = qaDAO.qaSearch(qaDTO,choice);
			RequestDispatcher dis = request.getRequestDispatcher("boardQA.jsp");
			request.setAttribute("list", qaList);
			request.setAttribute("page", list);
/*			request.setAttribute("option", option);
			request.setAttribute("search", search);*/

			dis.forward(request, response);
		}//글검색
		else if(command.equals("/qaDelete.qa")) {//글 삭제
			String no = request.getParameter("no");
			qaDTO.setNo(Integer.parseInt(no));
			qaDAO.qaDelete(qaDTO);
			response.sendRedirect("qaList.qa");
		}//글 삭제
		else if(command.equals("/qaUpdate.qa")) {//게시글 수정
			String no = request.getParameter("no");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			qaDTO.setNo(Integer.parseInt(no));
			qaDTO.setTitle(title);
			qaDTO.setAuthor(author);
			qaDTO.setContent(content);
			qaDAO.qaUpdate(qaDTO);
			response.sendRedirect("qaList.qa");
		}//게시글수정
		else if(command.equals("/qaContent.qa")) {//게시글 내용
			String no = request.getParameter("no");
			qaDTO.setNo(Integer.parseInt(no));
			qaDTO=qaDAO.qaContent(qaDTO);
			RequestDispatcher dis = request.getRequestDispatcher("qaContent.jsp");
			request.setAttribute("qaDTO", qaDTO);
			dis.forward(request, response);
		}//게시글 내용
	}
}
