<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>게시판 목록</title>
			<style>
				* {
				  padding: 0;
				  border: 0;
				  font-size: 14px;
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
				
				
				#bottom_wrap{					
					margin-top:20px;
					width:771px;
					background:#e9e9e9;
				}
				
				#search,#paging {
				  margin:20px;
				  display: flex;
				  align-items: center;
				  justify-content: center;
				}
				
				#dataPerPage{
					width:150px;
				}
				
				.pagingNum{
					width:335px;
				}
				
				.pagingNum a{
					font-size:15px;
					margin-left:20px;
				}
				
				#search{
					margin-top:20px;
				}
				
				#search select, #search input[type="text"], #search input[type="submit"], 
				#paging select{
				  height: 40px;
				  border: 2px solid #d9d9d9;
				  border-radius: 10px;
				  padding: 5px 15px;
				  font-size: 14px;
				  font-weight: bold;
				}
				
				#search select {
				  margin-right: 10px;
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
				  cursor:pointer;
				}
			</style>
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script>
				$(document).ready(function(){
					var dataPerPage = ${dataPerPage};
					if(dataPerPage==10)
						$("#dataPerPage").val("10").prop("selected",true);
					else if(dataPerPage==15)
						$("#dataPerPage").val("15").prop("selected",true);
					else if(dataPerPage==20)
						$("#dataPerPage").val("20").prop("selected",true);
				});
				function search(){
					var fm = document.frm;
					fm.action = "${pageContext.request.contextPath}/board/boardList.do";
					fm.method = "post";
					fm.submit();
				}
				
				function changePage(){
					var dataPerPage = $("#dataPerPage").val();
					var fm2 = document.frm2;
					fm2.action = "${pageContext.request.contextPath}/board/boardList.do?page=${pm.getScri().getPage()}&dataPerPage="+dataPerPage+"&searchOption=${pm.scri.searchOption}&searchContext=${pm.encoding(pm.scri.searchContext)}";
					fm2.method = "post";
					fm2.submit();
				} 

			</script>
		</head>
	<body>		
		<h1><a href="${pageContext.request.contextPath}/">홈 바로가기</a></h1>
		<h1>게시판 목록</h1>
		<div id="top_menu">
			<div id="write">
				<input type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardWrite.do'" value="글쓰기">
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
				<c:forEach var="bv" items="${boardList}">
				<tr class="board_col">
					<td style="text-align:center;">${bv.bidx}</td>
					<td style="overflow:hidden">
						<c:forEach var="i" begin="1" end="${bv.level_}" step="1">
							out.println("&nbsp;");
							<c:if test="${i==bv.level_}">
								out.println("&#8618;");
							</c:if>
						</c:forEach>
						<a href="${pageContext.request.contextPath}/board/boardContents.do?bidx=${bv.bidx}">${bv.subject}</a>
					</td>		
					<td>${bv.writer}</td>
					<td>${bv.writeday}</td>
					<td>${bv.viewCnt}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="bottom_wrap">	
			<form name="frm2">	
				<div id="paging">
					<span>
						<select id="dataPerPage" name="dataPerPage" onchange="changePage()">
	        				<option value="10" id="10">10개씩보기</option>
	        				<option value="15" id="15">15개씩보기</option>
	        				<option value="20" id="20">20개씩보기</option>
						</select>
					</span>
					<span class = "pagingNum">
						<c:if test="${pm.prev==true}">
							<a href="${pageContext.request.contextPath}/board/boardList.do?page=${pm.startPage-1}&dataPerPage=${dataPerPage}&searchOption=${pm.scri.searchOption}&searchContext=${pm.encoding(pm.scri.searchContext)}">◁이전</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<a href="${pageContext.request.contextPath}/board/boardList.do?page=${i}&dataPerPage=${dataPerPage}&searchOption=${pm.scri.searchOption}&searchContext=${pm.encoding(pm.scri.searchContext)}">${i}</a>
						</c:forEach>
						<c:if test="${pm.next && pm.endPage>0}">
							<a href="${pageContext.request.contextPath}/board/boardList.do?page=${pm.endPage+1}&dataPerPage=${dataPerPage}&searchOption=${pm.scri.searchOption}&searchContext=${pm.encoding(pm.scri.searchContext)}">다음▷</a>
						</c:if>
					</span>
				</div>
			</form>
			<form name = "frm">
				<div id="search">
					<span>
						<select name="searchOption">
							<option>제목만</option>
							<option>제목과내용</option>
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
		</div>
	</body>
</html>