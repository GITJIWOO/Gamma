package org.game.gameinfo.service;

import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;

public interface GameInfoService {

	public void registerGame(GameInfoVO vo); // 게임등록

	public GameInfoVO getGame(Long gnum); 	// 게임조회

	public void modifyGame(GameInfoVO vo); // 게임수정

	public void removeGame(Long gnum); 	// 게임삭제

	public List<GameInfoVO> gameList(String keyword); // 게임목록

	public List<GameInfoVO> getGameListPaging(GameSearchCriteria cri);
	
	public int getTotalGame(GameSearchCriteria cri);
}
