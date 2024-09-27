package imagebannerboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imagebannerboard.bean.ImagebannerboardDTO;
import imagebannerboard.bean.ImagebannerboardPaging;
import imagebannerboard.dao.ImagebannerboardDAO;

public class ImagebannerboardListService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 데이터
        int pg = 1;
        if (request.getParameter("pg") != null) pg = Integer.parseInt(request.getParameter("pg"));
                
        // 1페이지당 3개씩
        int endNum = pg * 3;
        int startNum = endNum - 2;
        
        // DB
        Map<String, Integer> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);
        
        ImagebannerboardDAO imagebannerboardDAO = ImagebannerboardDAO.getInstance();
        List<ImagebannerboardDTO> list = imagebannerboardDAO.imagebannerboardList(map);
        
        // 페이징 처리
        int totalA = imagebannerboardDAO.getTotalA();
        
        ImagebannerboardPaging imagebannerboardPaging = new ImagebannerboardPaging();
        imagebannerboardPaging.setCurrentPage(pg);
        imagebannerboardPaging.setPageBlock(3);
        imagebannerboardPaging.setPageSize(3);
        imagebannerboardPaging.setTotalA(totalA);
        
        imagebannerboardPaging.makePagingHTML();
                
        request.setAttribute("pg", pg);
        request.setAttribute("list", list);
        request.setAttribute("imagebannerboardPaging", imagebannerboardPaging);
        return "/main_admin/imagebannerboardList.jsp";
    }

}