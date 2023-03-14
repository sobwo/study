<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "java.sql.*"%>

<%  	
	//공통으로 사용하는 파일
	//DB에 등록
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "system";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //동적로딩 - 메모리에 올림
	Connection conn = DriverManager.getConnection(url,user,password); // db와 접속시킴
%>