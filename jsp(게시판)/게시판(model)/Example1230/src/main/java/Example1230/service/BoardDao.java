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

	public ArrayList<BoardVo> boardSearch(String option, String str){
		ArrayList<BoardVo> blist = new ArrayList<>();
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(option.equals( "제목만")) {
			sql = "select bidx,subject,writer,writeday,NVL(viewcnt,0) AS viewcnt,midx from board1230 WHERE DELYN = 'N' and instr(subject,?)>0 order by bidx DESC";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardVo bv = new BoardVo();	
					bv.setBidx(rs.getInt("bidx"));
					bv.setSubject(rs.getString("subject"));
					bv.setWriter(rs.getString("writer"));
					bv.setWriteday(rs.getString("writeday"));
					bv.setViewCnt(rs.getString("viewcnt"));
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
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else if(option.equals("제목+내용")) {
			sql = "select bidx,subject,writer,writeday,NVL(viewcnt,0) AS viewcnt,midx from board1230 WHERE DELYN = 'N' and instr(subject,?)>0 or instr(contents,?)>0 order by bidx DESC";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
				pstmt.setString(2, str);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardVo bv = new BoardVo();	
					bv.setBidx(rs.getInt("bidx"));
					bv.setSubject(rs.getString("subject"));
					bv.setWriter(rs.getString("writer"));
					bv.setWriteday(rs.getString("writeday"));
					bv.setViewCnt(rs.getString("viewcnt"));
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
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else if(option.equals("글작성자")) {
			sql = "select bidx,subject,writer,writeday,NVL(viewcnt,0) AS viewcnt,midx from board1230 WHERE DELYN = 'N' and instr(writer,?)>0 order by bidx DESC";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardVo bv = new BoardVo();	
					bv.setBidx(rs.getInt("bidx"));
					bv.setSubject(rs.getString("subject"));
					bv.setWriter(rs.getString("writer"));
					bv.setWriteday(rs.getString("writeday"));
					bv.setViewCnt(rs.getString("viewcnt"));
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
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return blist;
	}
	
	public ArrayList<BoardVo> boardSelectAll() {
 		ArrayList<BoardVo> blist = new ArrayList<BoardVo>();
 		String sql = "select bidx,depth,level_,subject,writer,TO_CHAR(writeday,'yyyy.mm.dd') AS writeday,NVL(viewcnt,0) AS viewcnt,midx from board1230 WHERE DELYN = 'N' order by originbidx DESC,depth asc,level_ asc";
 		
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVo bv = new BoardVo();	
				bv.setBidx(rs.getInt("bidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setViewCnt(rs.getString("viewcnt"));
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

	public void boardInsert(String subject, String contents, String writer, String ip, int midx, String pwd){
		PreparedStatement pstmt = null;
		
		String sql = "insert into board1230(bidx,originbidx,depth,level_,subject,contents,writer,ip,midx,pwd)"
				+"values(bidx_seq.nextval,bidx_seq.nextval,0,0,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,subject);
			pstmt.setString(2,contents);
			pstmt.setString(3,writer);
			pstmt.setString(4,ip);
			pstmt.setInt(5,midx);
			pstmt.setString(6, pwd);
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
	
	public BoardVo boardSelectOne(int bidx){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVo bv = new BoardVo();
		String sql = "select * from board1230 where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();

			while(rs.next()){
				bv.setBidx(rs.getInt("bidx"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("contents"));
				bv.setWriter(rs.getString("writer"));
				bv.setViewCnt(rs.getString("viewcnt"));
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
	
	public void boardViewCnt(int bidx) {
		String sql = "update board1230 set viewcnt = NVL(viewcnt,0)+1 where bidx = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
//				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void boardModify(String subject, String contents, int bidx){
		BoardVo bv = new BoardVo();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE board1230 SET subject = ?,contents=?,viewcnt=viewcnt-1 where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setInt(3, bidx);
			
			pstmt.executeQuery();
			
//			bv.setBidx(bidx);
//			bv.setSubject(subject);
//			bv.setContents(contents);
//			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int boardDelete(int bidx, String memberPw) {
		String sql = "update board1230 set delyn='Y' where bidx=? and pwd=?";
		PreparedStatement pstmt = null;
		int value = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			pstmt.setString(2, memberPw);
			value = pstmt.executeUpdate();
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
		return value;
	}
	
	public int boardReply(BoardVo bv) {
		int value = 0;
		
		String sql = "UPDATE board1230 SET depth = depth+1 WHERE originbidx = ? AND depth>0";
		String sql2 = "INSERT INTO board1230(bidx, ORiGINBIDX, depth, level_, subject, CONTENTS, writer, ip, midx,pwd)"
				+ "VALUES(bidx_seq.nextval,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth()+1);
			pstmt.setInt(3, bv.getLevel_()+1);
			pstmt.setString(4,bv.getSubject());
			pstmt.setString(5, bv.getContents());
			pstmt.setString(6, bv.getWriter());
			pstmt.setString(7, bv.getIp());
			pstmt.setInt(8, bv.getMidx());
			pstmt.setString(9, bv.getPwd());
			value = pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
		return value;
	}
	
}
