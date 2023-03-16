<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "Example1230.domain.*" %>
<% 
	ArrayList<BoardVo> boardList = (ArrayList<BoardVo>)request.getAttribute("boardList");
	int midx = Integer.parseInt( request.getParameter("midx"));
%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>게시판 목록</title>
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
				
				table {
				  border-collapse: collapse;
				  border: 0;
				  border-top: 2px solid black;
				}
				
				#main_board th {
				  height: 45px;
				  border-bottom: 1px solid #e4e4e4;
				}
				
				#main_board td {
				  text-align: center;
				  border-bottom: 1px solid #e4e4e4;
				}
				
				#main_board th:nth-child(1) {
				  width: 51px;
				}
				
				#main_board th:nth-child(2) {
				  width: 434px;
				}
				
				#main_board th:nth-child(3) {
				  width: 110px;
				}
				
				#main_board th:nth-child(4) {
				  width: 88px;
				}
				
				#main_board th:nth-child(5) {
				  width: 88px;
				}
				
				#main_board td {
				  height: 37px;
				}
				
				#main_board td:nth-child(2) {
				  text-align: left;
				  text-indent: 10px;
				}
				
				#write {
				  margin-bottom: 5px;
				  margin-left: 710px;
				}
				
				#write input {
				  font-size: 14px;
				  font-weight: bold;
				  width: 70px;
				  height: 35px;
				  cursor: pointer;
				}
				
				#write input:hover{
					background-color: gray;
				}
				
				#search {
				  margin-top: 50px;
				  display: flex;
				  align-items: center;
				  justify-content: center;
				}
				
				#search select, #search input[type="text"], #search input[type="submit"] {
				  height: 40px;
				  border: 2px solid #d9d9d9;
				  border-radius: 10px;
				  padding: 5px 15px;
				  font-size: 14px;
				  font-weight: bold;
				}
				
				#search select {
				  margin-right: 10px;
				  background-color: #f5f5f5;
				  outline: none;
				}
				
				#search input[type="text"] {
				  width: 200px;
				  height: 30px;
				  margin-right: 10px;
				}
				
				#search input[type="submit"] {
				  background-color: #4CAF50;
				  color: white;
				  cursor: pointer;
				}
				
				#search input[type="submit"]:hover {
				  background-color: #3e8e41;
				}

				
				a:link,
				a:visited {
				  text-decoration: none;
				  color: black;
				}
			</style>
			<script>
				function search(){
					var fm = document.frm;
					fm.action = "<%=request.getContextPath()%>/board/boardSearch.do"
					fm.method = "post";
					fm.submit();
				}
			</script>
		</head>
	<body>		
		<h1>게시판 목록</h1>
		<div id="top_menu">
			<div id="write">
				<input type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardWrite.do?midx=<%=midx%>'" value="글쓰기">
			</div>
		</div>
		<table id="main_board">
			<thead>
				<tr class="board_col">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%for(BoardVo bv : boardList) {%>
				<tr class="board_col">
					<td style="text-align:center;"><%= bv.getBidx() %></td>
					<td style="overflow:hidden"><a href="<%=request.getContextPath()%>/board/boardContents.do?bidx=<%=bv.getBidx()%>&midx=<%=midx%>" ><%= bv.getSubject() %></a></td>
					<td><%=bv.getWriter() %></td>
					<td><%=bv.getWriteday() %></td>
					<td><%=bv.getViewCnt() %></td>
				<%}%>
				</tr>
			</tbody>
		</table>	
		<form name="frm">	
			<div id="search">
				<span>
					<select name="searchOption">
						<option>제목만</option>
						<option>제목+내용</option>
						<option>글작성자</option>
					</select>				
				</span>
				<span>
					<input type="text" name="searchContext" placeholder="검색어를 입력해주세요.">
				</span>
				<span>
					<input type="submit" name="submit" value="검색" onclick="search()">
				</span>	
			</div>
		</form>
	</body>
</html>