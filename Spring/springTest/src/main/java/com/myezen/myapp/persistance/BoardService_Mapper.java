package com.myezen.myapp.persistance;

import java.util.ArrayList;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;

public interface BoardService_Mapper {
	
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	public int boardTotal(SearchCriteria scri);
	public int boardInsert(BoardVo bv);
	public BoardVo boardSelectOne(int bidx);
	public int boardModify(BoardVo bv);
	public int boardDelete(int bidx);
}