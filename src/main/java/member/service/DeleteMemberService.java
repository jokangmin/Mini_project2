package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class DeleteMemberService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
		System.out.println("id : " + id);
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.deleteMem(id);

		session.invalidate();
		
		return "none";
	}
}
