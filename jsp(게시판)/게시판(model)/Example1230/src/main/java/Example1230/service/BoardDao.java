package Example1230.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Example1230.dbconn.Dbconn;
import Example1230.domain.BoardVo;
import Example1230.domain.MemberVo;

public class BoardDao {
	private Connection conn;

	public BoardDao(){
		Dbconn dbconn = new Dbconn();
		this.conn = dbconn.getConnection();
	}
	
	public ArrayList<BoardVo> boardSelectAll() {
 		ArrayList<BoardVo> blist = new ArrayList<BoardVo>();
 		String sql = "select bidx,subject,contents,writer,ip,midx from board1230 order by midx desc";
 		
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				BoardVo bv = new BoardVo();	
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("contents"));
				bv.setWriter(rs.getString("writer"));
				bv.setIp(rs.getString("ip"));
				bv.setMidx(rs.getInt("midx"));
				blist.add(bv);
			}
			
		} catch (SQLException e) {
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

 		return blist;
 	}

	 
}
