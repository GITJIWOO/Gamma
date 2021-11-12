package org.game.gameinfo.service;

import java.sql.SQLException;
import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameTagVO;
import org.springframework.web.bind.annotation.RequestParam;

public interface GameTagService {

//	public void registerTag(@RequestParam("tagname") String[] tagname, GameInfoVO vo);	// 태그등록
	public void registerTag(GameInfoVO vo);
	
//	public List<GameTagVO> getTag(Long gnum);	// 태그 조회
	public GameInfoVO getTag(Long gnum);
	
	public void modifyTag(GameInfoVO vo);	// 태그 수정
	
	public void removeTag(Long gnum);		// 태그 삭제
}
