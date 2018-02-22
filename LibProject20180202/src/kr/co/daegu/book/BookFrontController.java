package kr.co.daegu.book;

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


@WebServlet("*.book")
/*@MultipartConfig(maxFileSize=1024*1024*2,location="C:\\Develop\\workspacejsp\\LibProject20180123\\WebContent\\images\\book")*/
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "/home/hosting_users/kdh0115/tomcat/webapps/ROOT/images/book")
public class BookFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public BookDTO bookDTO;
	public BookDAO bookDAO;
	private int cnt;
	private ArrayList<BookDTO> bookList;
	
    public BookFrontController() {
    	bookDTO = new BookDTO();
    	bookDAO = new BookDAO();
    }

  //파일명 얻기
  	private String getFilename(Part part) {
  		String fileName = null;
  		String contentDispositionHeader=part.getHeader("content-disposition");
  		String[] elements = contentDispositionHeader.split(";");
  		for(String element:elements) {
  			if(element.trim().startsWith("filename")) {
  				fileName = element.substring(element.indexOf('=')+1);
  				fileName = fileName.trim().replace("\"", "");
  			}
  		}
  		return fileName;
  	}
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());


		if(command.equals("/bookRegister.book")) {//도서등록
			
			String title = request.getParameter("title");
			String sutitle = request.getParameter("sutitle");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			String publishing = request.getParameter("publishing");
			String bookPage = request.getParameter("bookPage");
			String bookInf = request.getParameter("bookInf");
			String authorInf = request.getParameter("authorInf");
			String tableOfCon = request.getParameter("tableOfCon");
			String tableOfConTwo = request.getParameter("tableOfConTwo");
			String inBook = request.getParameter("inBook");
			String publishReview = request.getParameter("publishReview");
			
			//파일 업로드
			Part part = request.getPart("icon");
			String fileName = getFilename(part);
		
			bookDTO.setTitle(title);
			bookDTO.setSutitle(sutitle);
			bookDTO.setAuthor(author);
			bookDTO.setPublisher(publisher);
			bookDTO.setPublishing(publishing);
			bookDTO.setBookPage(Integer.parseInt(bookPage));
			bookDTO.setBookInf(bookInf);
			bookDTO.setAuthorInf(authorInf);
			bookDTO.setTableOfCon(tableOfCon);
			bookDTO.setTableOfConTwo(tableOfConTwo);
			bookDTO.setInBook(inBook);
			bookDTO.setPublishReview(publishReview);
			bookDTO.setIcon(fileName);
			cnt=bookDAO.bookInsert(bookDTO);
			
			if(fileName!=null&&!fileName.isEmpty()) {
				//part.write("c:\\upload\\"+fileName);
				part.write(fileName);
			}

			out.print("<a href='index.jsp'><img src='images/header_logo.gif' height='50px'></a><br>");
			if(cnt==1) {
				out.print(cnt+"권의 도서가 등록되었습니다.<br>");
			}else {
				out.print(cnt+"권의 도서가 등록되었습니다.<br>오류가 발생했습니다.<br>다시 시도 해주세요.<br>많이 발생하는 오류: 너무 많은 내용을 저장<br>");
			}
			out.print("<a href='bookManage.jsp'>이전으로</a>");
		}//도서등록
		
		else if(command.equals("/bookDelete.book")) {//도서삭제
			String title  = request.getParameter("title");
			String author  = request.getParameter("author");
			bookDTO.setTitle(title);
			bookDTO.setAuthor(author);
			cnt=bookDAO.bookDelete(bookDTO);
			out.print("<a href='index.jsp'><img src='images/header_logo.gif' height='50px'></a><br>");
			if(cnt>0) {
				out.print(cnt+"권의 도서가 삭제되었습니다.<br>");
			}else {
				out.print("일치하는 도서가 없습니다.<br>");
			}
			out.print("<a href='bookManage.jsp'>이전으로</a>");
		}//도서삭제		
		
		else if(command.equals("/bookUpdateConfirm.book")) {//도서수정 - DB에 저장되어 있는 도서 정보 가져오기
			//수정전폼
			String title=request.getParameter("title");
			String author=request.getParameter("author");
			bookDTO.setTitle(title);
			bookDTO.setAuthor(author);
			bookDTO=bookDAO.bookConfirm(bookDTO);
			
			if(bookDTO.getRegistNum()==null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("bookUpdate.jsp");
				request.setAttribute("bookcheck", false);
				dispatcher.forward(request, response);
				
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("bookUpdateForm.jsp");
				request.setAttribute("bookDTO", bookDTO);
				dispatcher.forward(request, response);
			}
		}//도서수정 - DB에 저장되어 있는 도서 정보 가져오기
		
		
		if(command.equals("/bookBest.book")) { //인기도서
			
			String title = request.getParameter("title");
			bookDTO = new BookDTO();
			bookDTO.setTitle(title);
			System.out.println(title);
			bookDTO=bookDAO.bookBest(bookDTO);
			RequestDispatcher dispatcher = request.getRequestDispatcher("bookInformation.jsp");
			request.setAttribute("bookDTO", bookDTO);
			dispatcher.forward(request, response);
		
		}//인기도서
		
		else if(command.equals("/bookUpdate.book")) {//도서수정
			//실제수정
			String title = request.getParameter("title"); 
			String sutitle = request.getParameter("sutitle");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			String publishing  = request.getParameter("publishing");
			String bookPage = request.getParameter("bookPage");
			String bookInf = request.getParameter("bookInf");
			String authorInf = request.getParameter("authorInf");
			String tableOfCon = request.getParameter("tableOfCon");
			String tableOfConTwo = request.getParameter("tableOfConTwo");
			String inBook = request.getParameter("inBook");
			String publishReview = request.getParameter("publishReview");
			String registNum = request.getParameter("registNum");
			
			//파일 업로드
			Part part = request.getPart("icon");
			String fileName = getFilename(part);
			
			bookDTO.setTitle(title);
			bookDTO.setSutitle(sutitle);
			bookDTO.setAuthor(author);
			bookDTO.setIcon(fileName);
			bookDTO.setPublishing(publishing);
			bookDTO.setPublisher(publisher);
			bookDTO.setBookPage(Integer.parseInt(bookPage));
			bookDTO.setBookInf(bookInf);
			bookDTO.setAuthorInf(authorInf);
			bookDTO.setTableOfCon(tableOfCon);
			bookDTO.setTableOfConTwo(tableOfConTwo);
			bookDTO.setInBook(inBook);
			bookDTO.setPublishReview(publishReview);
			bookDTO.setRegistNum(registNum);
			
			cnt=bookDAO.bookUpdate(bookDTO);

			if(fileName!=null&&!fileName.isEmpty()) {
				//part.write("c:\\upload\\"+fileName);
				part.write(fileName);
			}
			
			out.print("<a href='index.jsp'><img src='images/header_logo.gif' height='50px'></a><br>");
			if(cnt==1) {
				out.print(cnt+"권의 도서가 수정되었습니다.<br>");
			}else {
				out.print(cnt+"권의 도서가 수정되었습니다.<br>오류가 발생했습니다.<br>다시 시도 해주세요.<br>많이 발생하는 오류: 너무 많은 내용을 저장<br>");
			}
			out.print("<a href='bookManage.jsp'>이전으로</a>");

		}//도서수정


		else if(command.equals("/bookSearch.book")) {//도서검색

			String setop=request.getParameter("setop");
			//검색 옵션 선택
			String content = request.getParameter("content");
			//검색어 내용
			String option = null;

			
			if(setop.equals("all")) {//검색 옵션이 all인 경우
				bookDTO.setTitle(content);
				bookDTO.setAuthor(content);	
				option="전체";
			}
			else if(setop.equals("title")) {//검색 옵션이 title인 경우
				bookDTO.setTitle(content);
				option="도서명";
			}
			else if(setop.equals("author")) {//검색 옵션이 author인 경우
				bookDTO.setAuthor(content);
				option="저자";
			}
			else if(setop.equals("titleNauthor")) {//검색 옵션이 titleNauthor인 경우
				bookDTO.setTitle(content);
				bookDTO.setAuthor(content);				
				option="도서명+저자";
			}
	

			bookList = bookDAO.bookSearch(bookDTO, setop);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("bookSearchResult.jsp");
			request.setAttribute("bookList", bookList);
			request.setAttribute("option", option);
			request.setAttribute("content", content);
			request.setAttribute("cnt", bookList.size());
			dispatcher.forward(request, response);

		}//도서검색 끝
		
		else if(command.equals("/bookList.book")) {//책전체출력
			bookList=bookDAO.bookList(bookDTO);
			RequestDispatcher dispatcher = request.getRequestDispatcher("bookList.jsp");
			request.setAttribute("bookList", bookList);
			//dispatcher.include(request, response);
			dispatcher.forward(request, response);
			
		}//책전체출력
		
		
		
		

	}
}
