package org.game.gameinfo.mapper;

import org.game.gameinfo.domain.GameTagVO;

public interface GameTagMapper {

	// 게임에 대한 태그 조회
	public GameTagVO selectTag(Long gtnum);
	
	// 게임 태그 추가
	public void insertTag(GameTagVO vo);
	
	// 게임 태그 삭제
	public void deleteTag(Long gtnum);
	
	// 게임 태그 수정
	public void updateTag(GameTagVO vo);
}
