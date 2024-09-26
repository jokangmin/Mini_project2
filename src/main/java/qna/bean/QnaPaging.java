package qna.bean;

public class QnaPaging {
    private int currentPage; // 현재 페이지
    private int pageBlock; // [이전][1][2][3][다음]
    private int pageSize; // 1페이지당 출력할 글 수
    private int totalA; // 총 글 수
    private StringBuilder pagingHTML; // HTML 페이지네이션

    public void makePaginHTML() {
        pagingHTML = new StringBuilder();

        int totalP = (totalA + pageSize - 1) / pageSize; // 총 페이지 수 계산
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 시작 페이지
        int endPage = startPage + pageBlock - 1; // 끝 페이지
        if (endPage > totalP) endPage = totalP; // 끝 페이지 조정

        // 이전 페이지 링크
        if (startPage != 1) {
            pagingHTML.append("<span class='paging' style='color: #1E2532; margin: 0 10px; cursor: pointer;' onclick='qnaPaging(" + (startPage - 1) + ")'>이전</span>");
        }

        // 페이지 번호 링크
        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                // 현재 페이지는 색상을 적용
                pagingHTML.append("<span class='current-paging' style='color: #007bff;  margin: 0 10px;'>" + i + "</span>"); // 현재 페이지 번호 색상은 빨간색
            } else {
                // 나머지 페이지 번호는 기본 색상
                pagingHTML.append("<span class='paging' style='color: #1E2532; cursor: pointer; margin: 0 10px;' onclick='qnaPaging(" + i + ")'>" + i + "</span>");
            }
        }

        // 다음 페이지 링크
        if (endPage < totalP) {
            pagingHTML.append("<span class='paging' style='color: #1E2532; margin: 0 10px; cursor: pointer;' onclick='qnaPaging(" + (endPage + 1) + ")'>다음</span>");
        }
    }

    public QnaPaging() {}

    public int getCurrentPage() {
        return currentPage;
    }

    public int getPageBlock() {
        return pageBlock;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalA() {
        return totalA;
    }

    public StringBuilder getPagingHTML() {
        return pagingHTML;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setTotalA(int totalA) {
        this.totalA = totalA;
    }

    public void setPagingHTML(StringBuilder pagingHTML) {
        this.pagingHTML = pagingHTML;
    }
}
