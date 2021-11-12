package org.game.gameinfo.service;

import java.sql.SQLException;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.RequirementVO;

public interface RequirementService {

	// 사양 등록
	public void registerRequirement(GameInfoVO vo);
	
	// 사양 조회
	public GameInfoVO getRequirement(Long gnum);
	
	// 사양수정
	public void modifyRequirement(GameInfoVO vo);
	
	// 사양 삭제
	public void removeRequirement(Long gnum);
}
