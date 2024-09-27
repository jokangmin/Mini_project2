package admin.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imagebannerboard.dao.ImagebannerboardDAO;

public class AdminMainBannerPrintService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ImagebannerboardDAO dao = ImagebannerboardDAO.getInstance();
		
		List<String> arraySeq = dao.getAllSeq(new HashMap<>());
		
		List<String> imageList = dao.getimage1(arraySeq);
		
		
		request.setAttribute("arraySeq", arraySeq);
		request.setAttribute("imageList", imageList);
	
		return "/main_admin/adminMainBannerPrint.jsp";

	}

}
