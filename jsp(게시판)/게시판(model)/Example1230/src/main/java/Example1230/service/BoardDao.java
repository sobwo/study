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
 		String sql = "select * from board1230 order by bidx desc";
 		
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				BoardVo bv = new BoardVo();	
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
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

	public void boardInsert(String subject, String contents, String writer, String ip, int midx){
		PreparedStatement pstmt = null;
		
		String sql = "insert into board1230(bidx,subject,contents,writer,ip,midx)"
				+"values(bidx_seq.nextval,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,subject);
			pstmt.setString(2,contents);
			pstmt.setString(3,writer);
			pstmt.setString(4,ip);
			pstmt.setInt(5,midx);
			pstmt.executeQuery();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public BoardVo boardSelect(int bidx){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVo bv = new BoardVo();
		String sql = "select bidx, subject, contents, writer, writeday from board1230 where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();

			while(rs.next()){
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("contents"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return bv;
	}
	
	public BoardVo boardModify(String subject, String contents, int bidx){
		BoardVo bv = new BoardVo();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE board1230 SET subject = ?,contents=? where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setInt(3, bidx);
			
			pstmt.executeQuery();
			
			bv.setBidx(bidx);
			bv.setSubject(subject);
			bv.setContents(contents);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bv;
		
	}
	
}
