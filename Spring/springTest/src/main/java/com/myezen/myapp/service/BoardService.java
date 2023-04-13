package com.myezen.myapp.service;

import java.util.ArrayList;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.SearchCriteria;


public interface BoardService {
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri);
	public int boardTotal(SearchCriteria scri);
}
