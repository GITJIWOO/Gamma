package org.game.gameinfo.service;

import org.game.gameinfo.domain.RequirementVO;

public interface RequirementService {

	public void register(RequirementVO vo);
	
	public RequirementVO getRequirement(Long grnum);
	
	public void modifyTag(RequirementVO vo);
	
	public void removeTag(Long grnum);
}
