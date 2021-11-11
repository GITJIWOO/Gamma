package org.game.gameinfo.service;

import java.sql.SQLException;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.RequirementVO;
import org.game.gameinfo.mapper.RequirementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	private RequirementMapper mapper;
	
	@Override
	public void registerRequirement(GameInfoVO vo){
		log.info("사양 등록");
		mapper.insertRequirement(vo);
	}

	@Override
	public GameInfoVO getRequirement(Long gnum) {
		GameInfoVO grno = mapper.selectRequirement(gnum);
		log.info(gnum + "번 사양 조회");
		return grno;
	}

	@Override
	public void modifyRequirement(GameInfoVO vo) {
		log.info("사양 수정");
		mapper.updateRequirement(vo);
		
	}

	@Override
	public void removeRequirement(Long gnum) {
		log.info("사양 삭제");
		mapper.deleteRequirement(gnum);
	}

}
