package flyTour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imagelist.bean.TourListPaging;
import tour.bean.TourDTO;
import tour.dao.TourDAO;

public class TourListFormService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int pg = 1;
        if (request.getParameter("pg") != null)
            pg = Integer.parseInt(request.getParameter("pg"));

        int endNum = pg * 3;
        int startNum = endNum - 2;

        Map<String, Integer> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        TourDAO tourDAO = TourDAO.getInstance();
        List<TourDTO> list = tourDAO.tourList(map);

        int total = tourDAO.getListTotal();

        TourListPaging tourListPaging = new TourListPaging();
        tourListPaging.setCurrentPage(pg);
        tourListPaging.setPageBlock(3);
        tourListPaging.setPageSize(3);
        tourListPaging.setTotal(total);

        tourListPaging.makePagingHTML();

        request.setAttribute("pg", pg);
        request.setAttribute("list", list);
        request.setAttribute("tourListPaging", tourListPaging);

        return "/flyTour/tourListForm.jsp";
    }
}
