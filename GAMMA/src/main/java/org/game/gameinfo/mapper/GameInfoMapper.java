package org.game.gameinfo.mapper;

import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;

public interface GameInfoMapper {
	
	// 전체 게임 조회
	public List<GameInfoVO> gameList();
	
	// 게임 추가
	public void insertGame(GameInfoVO vo);
	
	// 게임 상세 조회
	public GameInfoVO selectGame(Long gNum);
	
	// 게임 삭제
	public void deleteGame(Long gNum);
	
	// 게임 수정
	public void updateGame(GameInfoVO vo);
}
