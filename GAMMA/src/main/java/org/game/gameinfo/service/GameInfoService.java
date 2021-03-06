package org.game.gameinfo.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;

public interface GameInfoService {

	public void registerGame(GameInfoVO vo)  ; // 게임등록

	public GameInfoVO getGame(Long gnum); 	// 게임조회

	public void modifyGame(GameInfoVO vo); // 게임수정

	public void removeGame(Long gnum); 	// 게임삭제

	public List<GameInfoVO> gameList(String keyword); // 게임목록
	
	// 태그별 5개
	public List<GameInfoVO> listByTag(@Param("tagname") String tagname);
	// 전체 태그별
	public List<GameInfoVO> totalListByTag(@Param("tagname") String tagname);
	
	// 랜덤 4개 게임 조회
	public List<GameInfoVO> randomList();
	
	// 출시 날짜 최신순 3개
	public List<GameInfoVO> latestGame();
	
	// 액션 태그 4개 조회
	public List<GameInfoVO> actionList();

	public List<GameInfoVO> getGameListPaging(GameSearchCriteria cri);
	
	public int getTotalGame(GameSearchCriteria cri);
}
