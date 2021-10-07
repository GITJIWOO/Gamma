package org.game.gamelibrary.service;

import java.util.List;

import org.game.gamelibrary.domain.GameLibraryVO;

public interface GameLibraryService {
	
	// 라이브러리 조회
	public List<GameLibraryVO> getAllConsumerLibrary(String cid);
	
	// 라이브러리 게임 추가
	public void additionalLibrary(String cid, long gnum);
	
}
