package org.game.gameinfo.service;

import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.mapper.GameInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GameInfoServiceImpl implements GameInfoService {
	
	@Autowired
	private GameInfoMapper mapper;
	
	@Override
	public void registerGame(GameInfoVO vo) {
		log.info("게임 등록");
		mapper.insertGame(vo);
	}

	@Override
	public GameInfoVO getGame(Long gnum) {
		GameInfoVO gno = mapper.selectGame(gnum);
		log.info(gnum + "번 게임 조회");
		return gno;
	}

	@Override
	public void modifyGame(GameInfoVO vo) {
		log.info("게임 정보 수정");
		mapper.updateGame(vo);
	}

	@Override
	public void removeGame(Long gnum) {
		log.info("게임 삭제");
		mapper.deleteGame(gnum);
	}

	@Override
	public List<GameInfoVO> gameList() {
		List<GameInfoVO> gameList = mapper.gameList();
		log.info("전체 게임 조회");
		return gameList;
	}
	

}
