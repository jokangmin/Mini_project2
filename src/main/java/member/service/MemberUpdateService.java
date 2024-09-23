package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		String session_id = (String)session.getAttribute("id"); 
		MemberDTO memberDTO = memberDAO.getMemberId(session_id);
		
		request.setAttribute("session_id", session_id);
		request.setAttribute("memberDTO", memberDTO);
		
		return "/member/memberUpdate.jsp";
	}

}
