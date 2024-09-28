package flyTour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tour.bean.TourDTO;
import tour.dao.TourDAO;

public class TourWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//실제 폴더
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println("realFolder = " + realFolder);
		
		MultipartRequest multi = new MultipartRequest(
				request,
				realFolder,
				5 * 1024 * 1024,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String tourId = multi.getParameter("tourId");
		String tourSubject = multi.getParameter("tourSubject");
		String price = multi.getParameter("price");
		String description = multi.getParameter("description");
		String tourImage = multi.getOriginalFileName("tourImage");
		String fileName = multi.getFilesystemName("image1");
		
		if (tourImage == null || tourImage.isEmpty()) {
            tourImage = "odiga_logo.png";
        }
		
		System.out.println(tourImage + ", " + fileName);
		
		TourDTO tourDTO = new TourDTO();
		tourDTO.setTourId(tourId);
		tourDTO.setTourSubject(tourSubject);
		tourDTO.setPrice(price);
		tourDTO.setDescription(description);
		tourDTO.setTourImage(tourImage);
		
		TourDAO tourDAO = TourDAO.getInstance();
		tourDAO.tourWrite(tourDTO);
		
		return "none";
	}

}
