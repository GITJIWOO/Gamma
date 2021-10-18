package org.game.gameinfo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;

public interface GameInfoMapper {
	
	// 전체 게임 조회
	public List<GameInfoVO> gameList(String keyword);
	
	// 게임 추가
	public void insertGame(GameInfoVO vo);
	
	// 게임 상세 조회
	public GameInfoVO selectGame(Long gnum);
	
	// 게임 삭제
	public void deleteGame(Long gnum);
	
	// 게임 수정
	public void updateGame(GameInfoVO vo);
	
	// 태그별 게임 조회 5개
	public List<GameInfoVO> listByTag(@Param("tagname") String tagname);
	
	// 태그별 게임 조회
	public List<GameInfoVO> totalListByTag(@Param("tagname") String tagname);
	
	// 랜덤 4개 게임 조회
	public List<GameInfoVO> randomList();
	
	// 출시날짜 최신순 3개
	public List<GameInfoVO> latestGame();
	
	// 액션 태그 4개 조회
	public List<GameInfoVO> actionList();
	
	// 페이징 
	public List<GameInfoVO> getGameListPaging(GameSearchCriteria cri);
	
	// 전체 게임 수
	public int getTotalGame(GameSearchCriteria cri);
}
