<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="java.sql.*" %>
 <%!
 
 	public void memberInsert(Connection conn, String memberId, String memberPw, String memberName, String memberEmail, String memberGender, String memberAddr, String memberBirth){
	 	PreparedStatement pstmt = null;
	 	String sql2 = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)"
	 			+"VALUES(midx_seq.nextval,?,?,?,?,?,?,?,'null')";
		try{
			pstmt = conn.prepareStatement(sql2); //sql injection이 일어나지 않도록 방지해주는 클래스
			pstmt.setString(1,memberId);	// n번째 물음표에 memberId값 삽입
			pstmt.setString(2,memberPw);	
			pstmt.setString(3,memberName); 
			pstmt.setString(4,memberEmail);
			pstmt.setString(5,memberGender);
			pstmt.setString(6,memberAddr);
			pstmt.setString(7,memberBirth);
			
			pstmt.executeUpdate(); // 쿼리의 물음표에 값을 다담아놨다면 실행
		
		}catch(Exception e){

		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				
			}
		}

	}
 %>