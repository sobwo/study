<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "Example1230.domain.*" %>
<% 
	ArrayList<BoardVo> boardList = (ArrayList<BoardVo>)request.getAttribute("boardList"); 
%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>게시판 목록</title>
			
			<style>
				a:link{
				text-decoration:none;
				}
				*{padding:0, border:0; font-size:13px;font-family:"맑은 고딕";}
				body{display:flex; justify-content:center; flex-direction: column; align-items: center;}
				h1{font-size:30px;}
				table{border-collapse : collapse; border:0; border-top:2px solid black;}
					#main_board th{height:45px; border-bottom:1px solid #e4e4e4; }
					#main_board td{text-align:center; border-bottom:1px solid #e4e4e4;}
					#main_board th:nth-child(1){width:51px;}
					#main_board th:nth-child(2){ width:434px;}
					#main_board th:nth-child(3){width:110px;}
					#main_board th:nth-child(4){width:88px;}
					#main_board td{height:37px;}
					#main_board td:nth-child(2){text-align:left; text-indent:10px;}
				#search{margin-top:50px;}
				#search input[type=text]{width:200px;}
			
			</style>
		</head>
	<body>
		<h1>게시판 목록</h1>
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
				<tr class="board_col">
				<%for(BoardVo bv : boardList) {%>
					<td style="text-align:center;"><%= bv.getBidx()%></td>
					<td style="width:500px;"><%=bv.getSubject() %></td>
					<td><%=bv.getWriter() %></td>
					<td><%=bv.getWriteday() %></td>
					<td><%=bv.getDelyn() %></td>
				<%} %>
				</tr>

			</tbody>
		</table>
		<div id="search">
			<form>
				<span>
					<select>
						<option>제목만</option>
						<option>제목+내용</option>
						<option>글작성자</option>
					</select>				
				</span>
				<span>
					<input type="text" placeholder="검색어를 입력해주세요.">
				</span>
				<span>
					<input type="submit" name="submit" value="검색">
				</span>
			</form>
		</div>
		

	</body>
</html>