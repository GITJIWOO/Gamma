package org.game.gameinfo.service;

import java.util.ArrayList;
import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
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
	public void registerTag(GameInfoVO vo) {
		log.info("태그 등록");
		mapper.insertTag(vo);
		
	}
	
//	public void registerTag(String[] tagname,GameInfoVO vo) {
//		log.info("태그 등록");
//		for (int i = 0; i < tagname.length; i++) {
//			vo.setGnum(vo.getGnum());
//			vo.setTagname(tagname[i]);
//			mapper.insertTag(vo);
//		}
//	}

	@Override
	public GameInfoVO getTag(Long gnum) {
		GameInfoVO gno = mapper.selectOneTag(gnum);
		System.out.println("서비스단 태그조회: " + gno);
		return gno;
	}
//	public List<GameTagVO> getTag(Long gnum) {
//		List<GameTagVO> result = new ArrayList<GameTagVO>(); 
//		GameInfoVO resultOne = new GameInfoVO(); 
//		
//		try {
//			result = mapper.selectTag(gnum);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
////		log.info(gnum + " 태그 조회");
////		System.out.println(gnum + " 태그 조회");
////		System.out.println("서비스 태그:" + result);
//		return result;
//		
//	}

	@Override
	public void modifyTag(GameInfoVO vo) {
		log.info("태그 수정");
		mapper.updateTag(vo);
		
	}

	@Override
	public void removeTag(Long gnum) {
		log.info("태그 삿제");
		mapper.deleteTag(gnum);
	}

	

}
