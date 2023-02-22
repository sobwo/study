<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String memberId = request.getParameter("memberId");
	
	String idYn = "";
	if(memberId=="")
		idYn="N";
	else
		idYn="Y";
%>

{"idYn":"<%=idYn%>"}
