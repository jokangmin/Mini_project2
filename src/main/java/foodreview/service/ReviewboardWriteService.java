package foodreview.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import foodreview.bean.FoodreviewDTO;
import foodreview.dao.FoodreviewDAO;

public class ReviewboardWriteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println("realFolder = " + realFolder);
		
		//업로드
		MultipartRequest multi = new MultipartRequest(request, 
													  realFolder,
													  5 * 1024 * 1024, 
													  "UTF-8", 
													  new DefaultFileRenamePolicy());
		
		//데이터
		String reviewid = multi.getParameter("reviewid"); 
		String reviewname = multi.getParameter("reviewname"); 
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String gradeString = multi.getParameter("grade");
		
		int grade = 0;
		if (gradeString != null && !gradeString.isEmpty()) {
		    grade = Integer.parseInt(gradeString);
		} else {
		    System.out.println("Grade parameter is null or empty");
		}
		
		
		String image1 = multi.getFilesystemName("image1");
		
		FoodreviewDTO foodreviewDTO = new FoodreviewDTO();
		foodreviewDTO.setReviewid(reviewid);
		foodreviewDTO.setReviewname(reviewname);
		foodreviewDTO.setSubject(subject);
		foodreviewDTO.setContent(content);
		foodreviewDTO.setGrade(grade);
		if(image1 == null || image1.isEmpty()) {
			image1 = "odiga_logo.png";
		}
		foodreviewDTO.setImage1(image1);
		System.out.println(foodreviewDTO.toString());

		FoodreviewDAO foodreviewDAO = FoodreviewDAO.getInstance();
		foodreviewDAO.foodreviewWrite(foodreviewDTO);
		return "none";
	}

}
