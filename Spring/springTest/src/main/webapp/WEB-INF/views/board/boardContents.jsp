<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String msg = "";
	if(request.getAttribute("msg")!=null) 
		msg = (String)request.getAttribute("msg");
%> 
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>글 내용 페이지</title>
		<style>
			* {
			  padding: 0;
			  border: 0;
			  font-size: 13px;
			  font-family: "맑은 고딕";
			}
			
			body {
			  display: flex;
			  justify-content: center;
			  flex-direction: column;
			  align-items: center;
			}
			
			h1 {
			  font-size: 30px;
			}
			
			h1 a{
				font-size: 30px;
			}
			
			table {
			  border-collapse: collapse;
			  border: 0;
			  border-top: 2px solid black;
			}
			
			th,
			td {
			  width: 400px;
			  height: 40px;
			  border: 1px solid #e4e4e4;
			}
			
			th {
			  border-bottom: 0;
			  font-size: 20px;
			}
			
			td {
			  height: 410px;
			}
			
			tbody > tr:first-child td {
			  height: 40px;
			}
			
			tbody > tr:last-child td {
			  height: 40px;
			}
			
			tbody span {
			  width: 50px;
			  padding: 10px 0 10px 10px;
			}
			
			tbody span:nth-child(1) {
			  font-size: 18px;
			  font-weight: bold;
			  line-height: 30px;
			}
			
			tbody span:nth-child(4) {
			  font-size: 13px;
			}
			
			tbody span:nth-child(5) {
			  font-size: 12px;
			  color: gray;
			}
			
			tbody span:nth-child(6) {
			  font-size: 12px;
			  color: gray;
			}
			
			#btn {
			  float: right;
			  margin-top: 20px;
			}
			
			input {
			  width: 80px;
			  height: 30px;
			  border: 1px solid #a4a4a4;
			  border-radius: 10px;
			  font-size:14px;
			  cursor:pointer;
			}
			
			a:link,	a:visited {
				  text-decoration: none;
				  color: black;
			
		</style>
	</head>
	<body>
		<h1><a href="${pageContext.request.contextPath}/">홈 바로가기</a></h1>
		<h1>글 내용</h1>
		<table id="contents_board">
				<thead>
					<tr>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="border-top:0; height:80px;">
							<span>${bv.subject}</span><br/><br/>
							<span>${bv.writer}</span>
							<span>${bv.viewCnt}</span>
							<span>${bv.writeday}</span>	
						</td>
					</tr>
					<tr>
						<td colspan="2">${bv.contents}</td>
					</tr>
					<tr>
						<td style="width:400px; border:0;"></td>
						<td style="border:0;">
							<form>
								<div id="btn">
									<input type=button onclick="location.href='${pageContext.request.contextPath}/board/boardModify.do?bidx=${bv.bidx}'" value="수정">
									<input type=button onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?bidx=${bv.bidx}'" value="삭제">
									<input type=button onclick="location.href='${pageContext.request.contextPath}/board/boardReply.do?bidx=${bv.bidx}&originbidx=${bv.originbidx}&depth=${bv.depth}&level_=${bv.level_}'" value="답변">
									<input type=button onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'" value="목록">
								</div>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
			
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var msg = "<%=msg%>";
				if(msg != "") alert(msg);
			});
		</script>
	</body>
</html>