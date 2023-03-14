package Example1230.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Example1230.dbconn.Dbconn;
import Example1230.domain.MemberVo;

public class MemberDao {
	private Connection conn;
	
	public MemberDao(){ // MemberDao 생성할때 Dbconn 객체도 생성시킴 = conn객체 생성
		Dbconn dbconn = new Dbconn();
		this.conn = dbconn.getConnection();
	}
	 
 	public void memberInsert(String memberId, String memberPw, String memberName, String memberEmail, String memberGender, String memberAddr, String memberBirth){
	 
	 	PreparedStatement pstmt = null;
	 	String sql = "INSERT INTO member1230 (midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)"
	 			+"VALUES(midx_seq.nextval,?,?,?,?,?,?,?,'null')";
		try{
			pstmt = conn.prepareStatement(sql); //sql injection이 일어나지 않도록 방지해주는 클래스
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
 	
 	public ArrayList<MemberVo> memberSelectAll() {
 		ArrayList<MemberVo> alist = new ArrayList<MemberVo>();
 		String sql = "select midx, memberid, membername, delyn, writeday from member1230 order by midx desc";
 		
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				MemberVo mv = new MemberVo();	
				mv.setMidx(rs.getInt("midx"));
				mv.setMemberId(rs.getString("memberid"));
				mv.setMemberName(rs.getString("membername"));
				mv.setDelyn(rs.getString("delyn"));
				mv.setWriteDay(rs.getString("writeday"));
				alist.add(mv);
			}
			
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

 		return alist;
 	}
 	
 	public int memberIdCheck(String memberId){
		int value=0;
		String sql="select count(*) as cnt from member1230 where memberid=?";
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {   //커서가 이동을해서 다음값이 존재하면 참->진행할수 있다
				value = rs.getInt("cnt");
			}			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {				
				e.printStackTrace();
			}
		}				
		return value;
	}
}
