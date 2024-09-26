package foodreview.bean;

public class FoodreviewPaging {
	private int currentPage; //현재페이지
	private int pageBlock; //[이전][1][2][3][다음] 3개
	private int pageSize; // 1페이지당 5개씩
	private int totalA; //총글수
	private StringBuffer pagingHTML;
	
	public void makeFoodReviewPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize-1) / pageSize;
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1 ;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage != 1)
			pagingHTML.append("<a class='paging' href='/Mini_project2/travel/travel2.do?pg="+ (startPage-1) + "'>이전</a>");
	
		for(int i = startPage;i<=endPage;i++) {
			if(i == currentPage)
				pagingHTML.append("<a class='currentpaging' href='/Mini_project2/travel/travel2.do?pg="+ i + "'>" + i + "</a>");
			else
				pagingHTML.append("<a class='paging' href='/Mini_project2/travel/travel2.do?pg="+ i + "'>" + i + "</a>");
		}
		
		if(endPage < totalP)
			pagingHTML.append("<a class='paging' href='/Mini_project2/travel/travel2.do?pg="+ (endPage+1) + "'>다음</a>");
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalA() {
		return totalA;
	}

	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}

	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}
	
	
}
