package org.game.review.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReviewCommentDTO {
	
	private int btnNum;
	private int startPage, endPage;
	private boolean prev, next;
	private int total;
	private ReviewCommentCriteria rccri;
	
	public ReviewCommentDTO(ReviewCommentCriteria rccri, int total, int btnNum) {
		this.rccri = rccri;
		this.total = total;
		this.btnNum = btnNum;
		
		// 마지막 페이지
		this.endPage = (int)(Math.ceil(rccri.getPageNum() / (double)this.btnNum)) * rccri.getAmount();
		
		// 시작 페이지
		this.startPage = this.endPage - this.btnNum + 1;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / rccri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		// 이전 버튼 여부
		this.prev = this.startPage == 1 ? true : false;
		
		// 다음 버튼 여부
		this.next = this.endPage > realEnd;
	}
}
