package org.game.gameinfo.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class GameInfoPageDTO {

	private int btnNum; // btn갯수
	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev; // 이전버튼 유무
	private boolean next; // 다음버튼 유무
	private int total; // 전체 데이터 갯수

	private GameInfoCriteria cri; // 페이지, 글정보

	public GameInfoPageDTO(GameInfoCriteria cri, int total, int btnNum) {
		this.cri = cri;
		this.total = total;
		this.btnNum = btnNum;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) this.btnNum) * this.btnNum);

		this.startPage = this.endPage - this.btnNum + 1;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage == 1 ? false : true;
		
		this.next = this.endPage < realEnd;
	}
}
