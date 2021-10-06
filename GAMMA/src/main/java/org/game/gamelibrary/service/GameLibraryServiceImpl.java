package org.game.gamelibrary.service;

import java.util.List;

import org.game.gamelibrary.domain.GameLibraryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GameLibraryServiceImpl implements GameLibraryService {
	
	@Autowired
	private GameLibraryService service;

	// 라이브러리 조회
	@Override
	public List<GameLibraryVO> getAllConsumerLibrary(String cid) {
		List<GameLibraryVO> library = service.getAllConsumerLibrary(cid);
		return library;
	}

	// 라이브러리 게임 추가
	@Override
	public void additionalLibrary(String cid, long gnum) {
		service.additionalLibrary(cid, gnum);
	}
	
}
