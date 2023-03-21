package Example1230.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Example1230.dbconn.Dbconn;
import Example1230.domain.BoardVo;
import Example1230.domain.SearchCriteria;

public class BoardDao {
	private Connection conn;
	public BoardDao(){
		Dbconn dbconn = new Dbconn();
		this.conn = dbconn.getConnection();
	}
	
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
 		ArrayList<BoardVo> blist = new ArrayList<BoardVo>();
 		String str = null;
 		if(scri.getSearchOption().equals("제목만")) str = "and subject like ?";
 		else if(scri.getSearchOption().equals("제목과내용")) str = "and subject like ? or contents like ?";
 		else if(scri.getSearchOption().equals("글작성자")) str = "and writer like ?";
 		String sql = "SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM (select bidx,depth,level_,subject,writer,TO_CHAR(writeday,'yyyy.mm.dd') AS writeday,NVL(viewcnt,0) AS viewcnt,midx "
 				+ "from board1230 WHERE DELYN = 'N'"+str+" order by originbidx DESC,depth asc,level_ ASC)A)B WHERE B.rnum BETWEEN ? AND ?";
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		try {
 			
			if(countChar(str, '?')==1) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getSearchContext()+"%");
				pstmt.setInt(2, (scri.getPage()-1)*scri.getPagePerNum()+1);
				pstmt.setInt(3, scri.getPage()*scri.getPagePerNum());
				}
			else if(countChar(str, '?')==2) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getSearchContext()+"%");
				pstmt.setString(2, "%"+scri.getSearchContext()+"%");
				pstmt.setInt(3, (scri.getPage()-1)*scri.getPagePerNum()+1);
				pstmt.setInt(4, scri.getPage()*scri.getPagePerNum());
			}
			
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
//					conn.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

 		return blist;
 	}
	
	public int boardInsert(String subject, String contents, String writer, String ip, int midx, String pwd){
		PreparedStatement pstmt = null;
		int value = 0;
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
	
	public int boardModify(String subject, String contents, int bidx){
		int value = 0;
		BoardVo bv = new BoardVo();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE board1230 SET subject = ?,contents=?,viewcnt=viewcnt-1 where bidx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setInt(3, bidx);
			
			value =pstmt.executeUpdate();
			
		} catch (SQLException e) {
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
	
	public int boardTotal(SearchCriteria scri) {
		int value = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String str = null;
		if(scri.getSearchOption().equals("제목만")) str = "and subject like ?";
 		else if(scri.getSearchOption().equals("제목과내용")) str = "and subject like ? or contents like ?";
 		else if(scri.getSearchOption().equals("글작성자")) str = "and writer like ?";
		
		String sql = "SELECT count(*) as cnt from board1230 where delyn='N'"+str;

		try {
			pstmt = conn.prepareStatement(sql);
			if(countChar(str, '?')==1) 
				pstmt.setString(1, "%"+scri.getSearchContext()+"%");
			else if(countChar(str, '?')==2) {
				pstmt.setString(1, "%"+scri.getSearchContext()+"%");
				pstmt.setString(2, "%"+scri.getSearchContext()+"%");
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				value = rs.getInt("cnt");
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
		return value;
	}
	
	public int countChar(String str, char c) {
		return str.length() - str.replace(String.valueOf(c), "").length();
	}
}
	

