package admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imagebannerboard.dao.ImagebannerboardDAO;

public class AdminMainBannerDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        String seq = request.getParameter("seq"); // 단일 seq 값 가져오기
        
        //String seq = "54"; // 단일 seq 값 가져오기


        ImagebannerboardDAO dao = ImagebannerboardDAO.getInstance();
        dao.imagemainboardDelete(seq); // DAO에서 삭제 메서드 호출

        return "/main_admin/adminBannerDeleteService.jsp";

}
}
