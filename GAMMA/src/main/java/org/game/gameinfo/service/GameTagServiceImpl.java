package org.game.gameinfo.service;

import org.game.gameinfo.domain.GameTagVO;
import org.game.gameinfo.mapper.GameTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GameTagServiceImpl implements GameTagService {

	@Autowired
	private GameTagMapper mapper;
	
	@Override
	public void registerTag(GameTagVO vo) {
		log.info("태그 등록");
		mapper.insertTag(vo);
	}

	@Override
	public GameTagVO getTag(Long gtnum) {
		GameTagVO gtno = mapper.selectTag(gtnum);
		log.info(gtnum + " 태그 조회");
		return gtno;
		
	}

	@Override
	public void modifyTag(GameTagVO vo) {
		log.info("태그 수정");
		mapper.updateTag(vo);
		
	}

	@Override
	public void removeTag(Long gtnum) {
		log.info("태그 삿제");
		mapper.deleteTag(gtnum);
	}

}
