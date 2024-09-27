package admin.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imagebannerboard.dao.ImagebannerboardDAO;

public class AdminMainBannerControlService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 System.out.println("안녕");
	
		 String[] seqArray = request.getParameterValues("seq");

	        	
	            for (String seq : seqArray) {
	            	
	                ImagebannerboardDAO dao = ImagebannerboardDAO.getInstance();
	                dao.mainbannerboardInsert(seq); 
	                
	                System.out.println("Received seq: " + seq);
	            }
	            
	            response.setContentType("application/json");
	            try (PrintWriter out = response.getWriter()) {
	                out.write("{\"message\":\"이미지가 성공적으로 추가되었습니다!\"}"); 
	            }
	            
	          return null ;
		
	}

}
