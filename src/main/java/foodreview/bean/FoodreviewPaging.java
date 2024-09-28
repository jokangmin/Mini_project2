package foodreview.bean;

public class FoodreviewPaging {
    private int currentPage; // 현재 페이지
    private int pageBlock; // [이전][1][2][3][다음] 3개
    private int pageSize; // 1페이지당 게시물 수
    private int totalA; // 총 글 수
    private StringBuffer pagingHTML;
    private String searchTerm; // 검색어 추가
    private String searchType; // 검색 타입 추가
    private String sortType; // 정렬 타입 추가

    public void makeFoodReviewPagingHTML() {
        pagingHTML = new StringBuffer();

        int totalP = (totalA + pageSize - 1) / pageSize;

        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > totalP) endPage = totalP;

        // 이전 페이지 링크
        if (startPage != 1) {
            pagingHTML.append("<a class='paging' href='../travel/travel2.do?pg=" + (startPage - 1) 
                              + (searchTerm != null && !searchTerm.isEmpty() ? "&searchTerm=" + searchTerm : "")
                              + (searchType != null && !searchType.isEmpty() ? "&searchType=" + searchType : "")
                              + (sortType != null && !sortType.isEmpty() ? "&sortType=" + sortType : "") + "'>이전</a>");
        }

        // 페이지 번호 링크
        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pagingHTML.append("<a class='currentpaging' href='../travel/travel2.do?pg=" + i 
                                  + (searchTerm != null && !searchTerm.isEmpty() ? "&searchTerm=" + searchTerm : "")
                                  + (searchType != null && !searchType.isEmpty() ? "&searchType=" + searchType : "")
                                  + (sortType != null && !sortType.isEmpty() ? "&sortType=" + sortType : "") + "'>" + i + "</a>");
            } else {
                pagingHTML.append("<a class='paging' href='../travel/travel2.do?pg=" + i 
                                  + (searchTerm != null && !searchTerm.isEmpty() ? "&searchTerm=" + searchTerm : "")
                                  + (searchType != null && !searchType.isEmpty() ? "&searchType=" + searchType : "") 
                                  + (sortType != null && !sortType.isEmpty() ? "&sortType=" + sortType : "") + "'>" + i + "</a>");
            }
        }

        // 다음 페이지 링크
        if (endPage < totalP) {
            pagingHTML.append("<a class='paging' href='../travel/travel2.do?pg=" + (endPage + 1) 
                              + (searchTerm != null && !searchTerm.isEmpty() ? "&searchTerm=" + searchTerm : "")
                              + (searchType != null && !searchType.isEmpty() ? "&searchType=" + searchType : "")
                              + (sortType != null && !sortType.isEmpty() ? "&sortType=" + sortType : "") + "'>다음</a>");
        }
    }

    // Getter 및 Setter 메서드들
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

    public String getSearchTerm() {
        return searchTerm;
    }

    public void setSearchTerm(String searchTerm) {
        this.searchTerm = searchTerm;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }
}
