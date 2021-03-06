package org.game.gamelibrary.service;

import java.util.List;

import org.game.gamelibrary.domain.GameLibraryVO;
import org.game.gamelibrary.domain.ResultLibraryVO;

public interface GameLibraryService {
	
	// 라이브러리 조회
	public List<ResultLibraryVO> getAllConsumerLibrary(String cid);
	
	// 라이브러리 게임 하나 조회
	public GameLibraryVO getOneConsumerLibrary(String cid, long gnum);
	
	// 라이브러리 게임 추가
	public void additionalLibrary(String cid, long gnum);
	
}
