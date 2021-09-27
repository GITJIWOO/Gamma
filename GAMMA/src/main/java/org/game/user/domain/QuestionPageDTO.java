package org.game.user.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QuestionPageDTO {
	private int btnNum;
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private QuestionCriteria cri;
	
	public QuestionPageDTO(QuestionCriteria cri, int total, int btnNum) {
		this.cri = cri;
		this.total = total;
		this.btnNum = btnNum;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)this.btnNum) * this.btnNum);
		
		this.startPage = this.endPage - this.btnNum + 1;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage == 1 ? false : true;
		
		this.next = this.endPage < realEnd;
	}
}