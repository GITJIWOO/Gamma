package org.game.gameinfo.service;

import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameTagVO;

public interface GameTagService {

	public void registerTag(GameInfoVO vo);	// 태그등록
	
	public List<GameInfoVO> getTag(Long gnum);	// 태그 조회
	
	public void modifyTag(GameInfoVO vo);	// 태그 수정
	
	public void removeTag(Long gnum);		// 태그 삭제
}
