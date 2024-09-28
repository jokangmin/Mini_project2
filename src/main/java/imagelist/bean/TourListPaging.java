package imagelist.bean;

public class TourListPaging {
    private int currentPage;
    private int pageBlock;
    private int pageSize;
    private int total;
    private StringBuffer pagingHTML;

    // 기본 생성자
    public TourListPaging() {
    }

    public TourListPaging(int currentPage, int pageBlock, int pageSize, int total) {
        this.currentPage = currentPage;
        this.pageBlock = pageBlock;
        this.pageSize = pageSize;
        this.total = total;
        this.pagingHTML = new StringBuffer();
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

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public StringBuffer getPagingHTML() {
        return pagingHTML;
    }

    public void setPagingHTML(StringBuffer pagingHTML) {
        this.pagingHTML = pagingHTML;
    }

    public void makePagingHTML() {
        int totalP = (total + pageSize - 1) / pageSize;
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > totalP) endPage = totalP;

        pagingHTML = new StringBuffer();

        if (startPage != 1) {
            pagingHTML.append("<span id='paging' onclick='tourListPaging(" + (startPage - 1) + ")'>이전</span>");
        }

        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pagingHTML.append("<span id='currentPaging' onclick='tourListPaging(" + i + ")'>" + i + "</span>");
            } else {
                pagingHTML.append("<span id='paging' onclick='tourListPaging(" + i + ")'>" + i + "</span>");
            }
        }

        if (endPage < totalP) {
            pagingHTML.append("<span id='paging' onclick='tourListPaging(" + (endPage + 1) + ")'>다음</span>");
        }
    }
}
