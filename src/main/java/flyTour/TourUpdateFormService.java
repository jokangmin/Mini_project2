package flyTour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import tour.bean.TourDTO;
import tour.dao.TourDAO;

public class TourUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		TourDAO tourDAO = TourDAO.getInstance();
        TourDTO tourDTO = tourDAO.getTourById(seq);
        
        request.setAttribute("tourDTO", tourDTO);
        
		return "/flyTour/tourUpdateForm.jsp";
	}

}
