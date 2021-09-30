package org.game.gameinfo.service;

import org.game.gameinfo.domain.RequirementVO;
import org.game.gameinfo.mapper.RequirementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	private RequirementMapper mapper;
	
	@Override
	public void registerRequirement(RequirementVO vo) {
		log.info("사양 등록");
		mapper.insertRequirement(vo);
	}

	@Override
	public RequirementVO getRequirement(Long grnum) {
		RequirementVO grno = mapper.selectRequirement(grnum);
		log.info(grnum + "번 사양 조회");
		return grno;
	}

	@Override
	public void modifyRequirement(RequirementVO vo) {
		log.info("사양 수정");
		mapper.updateRequirement(vo);
		
	}

	@Override
	public void removeRequirement(Long grnum) {
		log.info("사양 삭제");
		mapper.deleteRequirement(grnum);
	}

}
