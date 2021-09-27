package org.game.gameinfo.service;

import org.game.gameinfo.domain.GameTagVO;

public interface GameTagService {

	public void registerTag(GameTagVO vo);
	
	public GameTagVO getTag(Long gtnum);
	
	public void modifyGame(GameTagVO vo);
	
	public void removeTag(Long gtnum);
	

}
