package org.game.gameinfo.mapper;

import java.sql.SQLException;
import java.util.List;

import org.game.gameinfo.domain.GameInfoVO;

public interface GameTagMapper {

	// 게임에 대한 태그 조회
	public List<GameInfoVO> selectTag(Long gnum) throws Exception;

	// 게임에 대한 태그 조회
	public GameInfoVO selectOneTag(Long gnum) throws SQLException;
	
	// 게임 태그 추가
	public void insertTag(GameInfoVO vo);
	
	// 게임 태그 삭제
	public void deleteTag(Long gnum);
	
	// 게임 태그 수정
	public void updateTag(GameInfoVO vo);
}
