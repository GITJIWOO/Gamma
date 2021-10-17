package org.game.gamelibrary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gamelibrary.domain.GameLibraryVO;
import org.game.gamelibrary.domain.ResultLibraryVO;

public interface GameLibraryMapper {
	
	// 라이브러리 조회
	public List<ResultLibraryVO> librarySelect(String cid);
	
	// 라이브러리 게임 하나 조회
	public GameLibraryVO librarySelectOne(@Param("cid") String cid, @Param("gnum") long gnum);
	
	// 라이브러리에 게임 추가
	public void libraryInsert(@Param("cid") String cid, @Param("gnum") long gnum);
	
}
