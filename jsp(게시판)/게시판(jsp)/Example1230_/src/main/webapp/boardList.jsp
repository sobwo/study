<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
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
					#main_board td:nth-child(1){width:51px; height:37px;}
					#main_board td:nth-child(2){text-align:left; width:434px;text-indent:10px;}
					#main_board td:nth-child(3){width:110px;}
					#main_board td:nth-child(4){width:88px;}
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
					<td style="text-align:center;">1</td>
					<td style="width:500px;">제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				<tr>
					<td>2</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
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