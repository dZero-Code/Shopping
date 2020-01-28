package com.pri.shop.model;

public class PaginationVO {
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, lastPage, start, end;
	private int cntPage = 5;
	private int cntPerPage = 5;
	
	public PaginationVO() {
	}
	public PaginationVO(int total, int nowPage) {
		setNowPage(nowPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}	
	public int setCntPage() {
		return cntPage;
	}
	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + "]";
	}
	
//	private int nowPage;				// 현재페이지
//	private int startPage;				// 시작페이지
//	private int endPage;				// 끝페이지
//	private int total;					// 게시글 총 갯수
//	private int lastPage;				// 마지막페이지
//	private int start;					// 페이지 시작 게시물 갯수 (SQL - limit의 start)
//	private int end;					// 페이지 마지막 게시물 갯수 (SQL - limit의 end)
//	private int cntPage = 5;			// 한 블럭당 페이지 갯수 
//	private int cntPerPage = 2;			// 페이지당 글 갯수
//	
//	public PaginationVO() {}
//	
//	public PaginationVO(int total, int nowPage) {
//		// 전체 게시물의 갯수
//		this.total = total;
//		
//		// 현재 페이지의 번호
//		this.nowPage = nowPage;
//				
//		// 제일 마지막 페이지 계산
//		this.lastPage = (int) Math.ceil((double)this.total / (double)this.cntPerPage);
//		
//		// 끝 페이지 계산
//		this.endPage = ((int) Math.ceil((double)this.nowPage / (double)this.cntPage)) * this.cntPage;
//		if(this.lastPage < this.endPage) {
//			this.endPage = this.lastPage;
//		}
//		
//		// 시작 페이지 계산
//		this.startPage = this.endPage - this.cntPage + 1;
//		if (this.startPage < 1) {
//			this.startPage = 1;
//		}
//		
//		// 디비에서 사용할 limit 범위 계산
//		this.end = this.nowPage * this.cntPerPage;
//		this.start = this.end - this.cntPerPage + 1;
//	}
//	
//	public int getNowPage() {return nowPage;}
//	public void setNowPage(int nowPage) {this.nowPage = nowPage;}
//	
//	public int getStartPage() {return startPage;}
//	public void setStartPage(int startPage) {this.startPage = startPage;}
//	
//	public int getEndPage() {return endPage;}
//	public void setEndPage(int endPage) {this.endPage = endPage;}
//	
//	public int getTotal() {return total;}
//	public void setTotal(int total) {this.total = total;}
//	
//	public int getCntPerPage() {return cntPerPage;}
//	public void setCntPerPage(int cntPerPage) {this.cntPerPage = cntPerPage;}
//	
//	public int getLastPage() {return lastPage;}
//	public void setLastPage(int lastPage) {this.lastPage = lastPage;}
//	
//	public int getStart() {return start;}
//	public void setStart(int start) {this.start = start;}
//	
//	public int getEnd() {return end;}
//	public void setEnd(int end) {this.end = end;}
//	
//	public int getCntPage() {return cntPage;}
//	public void setCntPage(int cntPage) {this.cntPage = cntPage;}
//	
//	@Override
//	public String toString() {
//		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
//				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
//				+ ", cntPage=" + cntPage + "]";
//	}
}