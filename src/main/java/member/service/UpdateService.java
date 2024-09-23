package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String name = (String)request.getParameter("name");
		String id = (String)request.getParameter("id");
		String pwd = (String)request.getParameter("pwd");
		String gender = (String)request.getParameter("gender");
		String email1 = (String)request.getParameter("email1");
		String email2 = (String)request.getParameter("email2");
		String tel1 = (String)request.getParameter("tel1");
		String tel2 = (String)request.getParameter("tel2");
		String tel3 = (String)request.getParameter("tel3");
		String zipcode = (String)request.getParameter("zipcode");
		String addr1 = (String)request.getParameter("addr1");
		String addr2 = (String)request.getParameter("addr2");
		
		
		MemberDTO memberDTO = new MemberDTO(name, id, pwd, gender, email1,email2, tel1,
				tel2, tel3, zipcode, addr1, addr2);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.update(memberDTO, id);
		
		HttpSession session = request.getSession();

		request.setAttribute("memberDTO", memberDTO);
		
		session.removeAttribute("id");
		
		return "/member/update.jsp";
	}

}
