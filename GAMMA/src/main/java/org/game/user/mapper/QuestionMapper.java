package org.game.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.user.domain.QuestionCriteria;
import org.game.user.domain.QuestionVO;

public interface QuestionMapper {
	// 관리자 여부 확인
	public int getAdmin(String cid);
	
	// 질문글 게시 
	public void insertQuestion(QuestionVO vo);
	
	// 모든 질문글 리스트 가져오기 
	// - 관리자는 모든 데이터 열람 가능 - qwriter에 정보없이 검색 가능-%%? / 일반 사용자는 기본으로 qwiter에 본인 계정 입력되도록 작성
	public List<QuestionVO> getQuestionList(String qwriter);
	public List<QuestionVO> getQuestionListP(@Param("cri")QuestionCriteria cri, @Param("qwriter")String qwriter);
	// 위 메서드 개수 조회 
	public int getCountQuestion(String qwriter);
	// 본인이 작성한 질문글 리스트 가져오기
	//public List<QuestionVO> getOwnQuestionList(String qwriter);
	
	// 유형별 조회
	public List<QuestionVO> getQtypeQuestion(String qtype);
	public List<QuestionVO> getQtypeQuestionP(QuestionCriteria cri, @Param("qtype")String qtype);
	// 위 메서드 개수 조회 
	public int getCountQtype(String qtype);
	/*
	public List<QuestionVO> getSoftnGameQuestion(String qtype);
	public List<QuestionVO> getLibraryQuestion(String qtype);
	public List<QuestionVO> getPurchaseQuestion(String qtype);
	public List<QuestionVO> getFriendsQuestion(String qtype);
	public List<QuestionVO> getChattingQuestion(String qtype);
	public List<QuestionVO> getAppQuestion(String qtype);
	public List<QuestionVO> getEtcQuestion(String qtype);
	*/

	// 본인이 작성한 질문글 하나만 가져오기
	public QuestionVO getOwnQuestion(Long qnum);
	
	// 본인이 작성한 질문글 수정하기 
	public void updateQuestion(QuestionVO vo);
	
	// 본인이 작성한 질문글 삭제하기
	public void deleteQuestion(Long qnum);
}