package org.game.gamelibrary.service;

import java.util.List;

import org.game.gamelibrary.domain.GameLibraryVO;
import org.game.gamelibrary.domain.ResultLibraryVO;
import org.game.gamelibrary.mapper.GameLibraryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GameLibraryServiceImpl implements GameLibraryService {
	
	@Autowired
	private GameLibraryMapper mapper;

	// 라이브러리 조회
	@Override
	public List<ResultLibraryVO> getAllConsumerLibrary(String cid) {
		List<ResultLibraryVO> library = mapper.librarySelect(cid);
		return library;
	}

	// 라이브러리 게임 추가
	@Override
	public void additionalLibrary(String cid, long gnum) {
		mapper.libraryInsert(cid, gnum);
	}
	
}
