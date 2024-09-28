package foodreview.bean;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class FoodreviewPaging {
    private int currentPage; // 현재 페이지
    private int pageBlock; // [이전][1][2][3][다음] 3개
    private int pageSize; // 1페이지당 게시물 수
    private int totalA; // 총 글 수
    private StringBuilder pagingHTML; // StringBuilder로 변경
    private String searchTerm; // 검색어 추가
    private String searchType; // 검색 타입 추가
    private String sortType; // 정렬 타입 추가

    public void makeFoodReviewPagingHTML() {
        pagingHTML = new StringBuilder();

        int totalP = (totalA + pageSize - 1) / pageSize;  // 총 페이지 수
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;  // 시작 페이지
        int endPage = startPage + pageBlock - 1;  // 끝 페이지
        if (endPage > totalP) endPage = totalP;  // 끝 페이지가 총 페이지 수를 넘지 않도록 처리

        // 이전 페이지 링크
        if (startPage != 1) {
            appendLink(startPage - 1, "이전");
        }

        // 페이지 번호 링크
        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pagingHTML.append("<a class='currentpaging'>" + i + "</a>");
            } else {
                appendLink(i, String.valueOf(i));
            }
        }

        // 다음 페이지 링크
        if (endPage < totalP) {
            appendLink(endPage + 1, "다음");
        }
    }

    private void appendLink(int page, String label) {
        String url = buildUrl(page);
        pagingHTML.append("<a class='paging' href='" + url + "'>" + label + "</a>");
    }

    private String buildUrl(int page) {
        StringBuilder urlBuilder = new StringBuilder("../travel/travel2.do?pg=" + page);
        
        try {
            if (searchTerm != null && !searchTerm.isEmpty()) {
                urlBuilder.append("&searchTerm=").append(URLEncoder.encode(searchTerm, StandardCharsets.UTF_8));
            }
            if (searchType != null && !searchType.isEmpty()) {
                urlBuilder.append("&searchType=").append(URLEncoder.encode(searchType, StandardCharsets.UTF_8));
            }
            if (sortType != null && !sortType.isEmpty()) {
                urlBuilder.append("&sortType=").append(URLEncoder.encode(sortType, StandardCharsets.UTF_8));
            }
        } catch (Exception e) {
            e.printStackTrace(); // 인코딩 오류 처리
        }

        return urlBuilder.toString();
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

    public StringBuilder getPagingHTML() {
        return pagingHTML;
    }

    public void setPagingHTML(StringBuilder pagingHTML) {
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
