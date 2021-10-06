package org.game.gamelibrary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gamelibrary.domain.GameLibraryVO;

public interface GameLibraryMapper {
	
	// 라이브러리 조회
	public List<GameLibraryVO> librarySelect(String cid);
	
	// 라이브러리에 게임 추가
	public void libraryInsert(@Param("cid") String cid, @Param("gnum") long gnum);
	
}
