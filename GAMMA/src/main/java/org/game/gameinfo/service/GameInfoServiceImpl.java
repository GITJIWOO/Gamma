package org.game.gameinfo.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;
import org.game.gameinfo.mapper.GameInfoMapper;
import org.game.gameinfo.mapper.GameTagMapper;
import org.game.gameinfo.mapper.RequirementMapper;
import org.game.gamelibrary.service.GameLibraryService;
import org.game.review.service.ReviewCommentService;
import org.game.review.service.ReviewLikeService;
import org.game.review.service.ReviewService;
import org.game.user.service.ConsumerBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class GameInfoServiceImpl implements GameInfoService {
	
	@Autowired 
	private GameInfoMapper mapper;
	
	@Autowired
	private GameTagMapper tagMapper;
	
	@Autowired
	private RequirementMapper requirementMapper;
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@Autowired
	private ReviewCommentService reviewCommentService;
	
	@Autowired
	private ConsumerBasketService bascketService;
	
	@Autowired
	private GameLibraryService libraryService;

	
	@Transactional
	@Override
	public void registerGame(GameInfoVO vo){
		log.info("게임 등록");
//		try {
			mapper.insertGame(vo);
			tagMapper.insertTag(vo);
			requirementMapper.insertRequirement(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//		}
	}

	@Override
	public GameInfoVO getGame(Long gnum) {
		GameInfoVO gno = mapper.selectGame(gnum);
		log.info(gnum + "번 게임 조회");
		return gno;
	}

	@Transactional
	@Override
	public void modifyGame(GameInfoVO vo) {
		log.info("게임 정보 수정");
		mapper.updateGame(vo);
		tagMapper.updateTag(vo);
		requirementMapper.updateRequirement(vo);
		
	}

	@Transactional
	@Override
	public void removeGame(Long gnum) {
		System.out.println("서비스단 삭제 진입");
//		log.info("게임 삭제");
		mapper.deleteGame(gnum);
		tagMapper.deleteTag(gnum);
		requirementMapper.deleteRequirement(gnum);
//		bascketService.removeConsumerBasket(cid, gnum);
		
		
		System.out.println("서비스단 삭제 막줄");
	}

	

	@Override
	public List<GameInfoVO> gameList(String keyword) {
		List<GameInfoVO> gameList = mapper.gameList(keyword);
		log.info("전체 게임 조회");
		return gameList;
	}

	@Override
	public List<GameInfoVO> getGameListPaging(GameSearchCriteria cri) {
		List<GameInfoVO> gamePaging = mapper.getGameListPaging(cri);
		return gamePaging;
	}

	@Override
	public int getTotalGame(GameSearchCriteria cri) {
		return mapper.getTotalGame(cri);
	}

	@Override
	public List<GameInfoVO> listByTag(String tagname) {
		List<GameInfoVO> listByTag = mapper.listByTag(tagname);
		return listByTag;
	}

	@Override
	public List<GameInfoVO> totalListByTag(String tagname) {
		List<GameInfoVO> totalListByTag = mapper.totalListByTag(tagname);
		return totalListByTag;
	}

	@Override
	public List<GameInfoVO> randomList() {
		List<GameInfoVO> randomList = mapper.randomList();
		return randomList;
	}

	@Override
	public List<GameInfoVO> latestGame() {
		List<GameInfoVO> latestGame = mapper.latestGame();
		return latestGame;
	}

	@Override
	public List<GameInfoVO> actionList() {
		List<GameInfoVO> actionList = mapper.actionList();
		return actionList;
	}

	
	

}
