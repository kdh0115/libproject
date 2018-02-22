<%@page import="kr.co.daegu.boardQA.PageToQA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  PageToQA to  = (PageToQA)request.getAttribute("page");  
  int curPage = to.getCurPage();//현재 페이지 번호
  int perPage = to.getPerPage();//페이지당 보여줄 레코드 개수 5
  int totalCount  = to.getTotalCount();//전체레코드개수(게시판전체행수)
  int totalPage = totalCount / perPage;// 보여줄 페이지 번호개수 20/5 = 5
  if( totalCount  %  perPage  != 0 ) totalPage++;
//20%5
  for( int i = 1 ; i <=  totalPage ; i++){
                          //4
          if(  curPage == i ){
    out.print( "<font size=10 color='red'>"+i +"</font>" );    
    }else{
   out.print( "<a href='qaList.qa?curPage="+i+"'>"+i  +"</a>&nbsp;" );
    }//end if
  }
%>
</body>
</html>