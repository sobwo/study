<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "Example1230.domain.*" %>
<% 
	ArrayList<BoardVo> boardList = (ArrayList<BoardVo>)request.getAttribute("boardList");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	int dataPerPage = (int)request.getAttribute("dataPerPage");
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
					if(<%=dataPerPage%>==10)
						$("#dataPerPage").val("10").prop("selected",true);
					else if(<%=dataPerPage%>==15)
						$("#dataPerPage").val("15").prop("selected",true);
					else if(<%=dataPerPage%>==20)
						$("#dataPerPage").val("20").prop("selected",true);
				});
				function search(){
					var fm = document.frm;
					fm.action = "<%=request.getContextPath()%>/board/boardList.do";
					fm.method = "post";
					fm.submit();
				}
				
				function changePage(){
					var dataPerPage = $("#dataPerPage").val();
					var fm2 = document.frm2;
					fm2.action = "<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getScri().getPage()%>&dataPerPage="+dataPerPage+"&searchOption=<%=pm.getScri().getSearchOption()%>&searchContext=<%=pm.encoding(pm.getScri().getSearchContext())%>";
					fm2.method = "post";
					fm2.submit();
				} 

			</script>
		</head>
	<body>		
		<h1><a href="<%=request.getContextPath()%>/index.jsp">홈 바로가기</a></h1>
		<h1>게시판 목록</h1>
		<div id="top_menu">
			<div id="write">
				<input type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardWrite.do'" value="글쓰기">
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
					<td style="overflow:hidden">
						<% for(int i=1;i<=bv.getLevel_();i++) {
								out.println("&nbsp;");
								if(i==bv.getLevel_()){
									out.println("&#8618;");
									}
								}%>
						<a href="<%=request.getContextPath()%>/board/boardContents.do?bidx=<%=bv.getBidx()%>"><%= bv.getSubject() %></a>
					</td>		
					<td><%=bv.getWriter() %></td>
					<td><%=bv.getWriteday() %></td>
					<td><%=bv.getViewCnt() %></td>
				<%} %>
				</tr>
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
						<% if(pm.isPrev()){ %>
							<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getStartPage()-1%>&dataPerPage=<%=dataPerPage%>&searchOption=<%=pm.getScri().getSearchOption()%>&searchContext=<%=pm.encoding(pm.getScri().getSearchContext())%>">◁이전</a>
						<%} %>
						<%for (int i=pm.getStartPage(); i<=pm.getEndPage();i++) {%>
							<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=i%>&dataPerPage=<%=dataPerPage%>&searchOption=<%=pm.getScri().getSearchOption()%>&searchContext=<%=pm.encoding(pm.getScri().getSearchContext())%>"><%=i%></a>
						<%} %>
						<% if(pm.isNext() && pm.getEndPage()>0){%>
							<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getEndPage()+1%>&dataPerPage=<%=dataPerPage%>&searchOption=<%=pm.getScri().getSearchOption()%>&searchContext=<%=pm.encoding(pm.getScri().getSearchContext())%>">다음▷</a>
						<%} %>
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