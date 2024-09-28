
package flyTour;

import javax.servlet.http.HttpServletRequest; import
javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import tour.dao.TourDAO;

public class TourDeleteService implements CommandProcess {
	
 @Override
	public String requestPro(HttpServletRequest request,
	HttpServletResponse response) throws Throwable {
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	TourDAO tourDAO = TourDAO.getInstance();
	
	tourDAO.deleteTour(seq);
	
	return "/flyTour/tourListForm.jsp";
	} 
 }
 

