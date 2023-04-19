<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.myezen.myapp.domain.BoardVo" %>   
<%
	String msg = "";
	if(request.getAttribute("msg")!=null) 
		msg = (String)request.getAttribute("msg");
%> 
<% BoardVo bv   = (BoardVo)request.getAttribute("bv"); %>   
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
			input:focus,textarea:focus{
				outline:1px solid #e4e4e4;
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
						<td id="download" colspan="2" style="height:30px;"></td>
					</tr>
					<tr>
						<td colspan="2" style="height:400px;">
							<%
								if (bv.getFileName() ==null){
								}else{
								String exp =  bv.getFileName().substring(bv.getFileName().length()-3, bv.getFileName().length());
								
								if (exp.equals("jpg") || exp.equals("gif") || exp.equals("png")   ) { %>
								<img src="<%=request.getContextPath()%>/board/displayFile.do?fileName=<%=bv.getFileName()%>"  width="800px" height="100px">
						</td>
							<%} }%>
					</tr>
					<tr>
						<td colspan='2' style='font-size:18px;font-weight:bold;height:80px;vertical-align:bottom;border:0'>댓글</td>
					</tr>
					<tr>
						<td style='width:70%;height:40px;border-right:0'><input type='text' id="cwriter" name='cwriter' style='width:100%;border:0' placeholder='작성자를 입력해 주세요.'></td>
						<td style='width:30%;height:40px;border-left:0;text-align:right'><input type='button' id="save" value='등록'></td>
					</tr>
					<tr>
						<td colspan="2" style='height:100px;'><textarea id="ccontents" name='ccontents' style='width:100%;height:100%;border:1px solid #e4e4e4;resize: none;'placeholder='댓글을 입력해 주세요.'></textarea></td>
					</tr>
					<tr>
						<td style="width:800px; border:0;"></td>
						<td style="border:0;">
							<form>
								<div id="btn">
									<input id="nextBlock" type="hidden" value="2" />
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
			<div id="tbl"></div>
			
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var msg = "<%=msg%>";
				if(msg != "") alert(msg);
				var originalFileName = getOriginalFileName("<%=bv.getFileName()%>");
				
				var str2= getImageLink("<%=bv.getFileName()%>");
				
				var str="";
				str = "<div><a href='<%=request.getContextPath()%>/board/displayFile.do?fileName="+str2+"'>"+originalFileName+"</a></div>";
				
				$("#download").html(str);
				
				$.boardCommentList();
				
				$("#save").click(function(){
					var bidx = ("${bv.bidx}");
					var cwriter = $("#cwriter").val();
					var ccontents = $("#ccontents").val();
					var nextBlock = $("#nextBlock").val();
					var midx = <%= session.getAttribute("midx")%>;
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath}/comment/commentWrite.do" ,
						dataType : "json",
						data : {
								"bidx" : bidx,
								"cwriter" :  cwriter,
								"ccontents" : ccontents,
								"nextBlock" : nextBlock,
								"midx" : midx
						},
						cache : false,
						success : function(data){
									alert("등록성공");
						},
						error : function(){
									alert("등록실패");
									alert("bidx : "+bidx+" cwriter : "+cwriter+" ccontents : "+ccontents+" midx : "+midx);
									
									
						} 	
					});	
				});
			});
			function getOriginalFileName(fileName){
				var idx = fileName.lastIndexOf("_")+1;
					
				return fileName.substr(idx);	
			}
			
			function getImageLink(fileName){
				
				if(!checkImageType(fileName)){
					return fileName;
				}
				
				var front = fileName.substr(0,12);
				var end = fileName.substr(14);
				
				return front+end;
			}
			
			function checkImageType(fileName){
				var pattern  = /jpg$|gif$|png$|jpeg$/i;
				
				return fileName.match(pattern);
			}
			
			$.boardCommentList = function(){
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/comment/<%=bv.getBidx()%>/commentList.do",
					dataType : "json",
					cache : false,
					success : function(data){
						alert("등록성공");	
						commentList(data);
					},
					error : function(){
							alert("등록실패");						
					} 	
				});	
			}
			
			function commentList(data){
				alert(data.length);
				var str = "";
				$(data).each(function(){
					str += "<div>"+this.cwriter+"</div><div>"+this.ccontents+"</div>" ;
				});
				
				$("#tbl").html(str);
			}
			
		</script>
	</body>
</html>