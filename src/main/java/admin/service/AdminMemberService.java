package admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class AdminMemberService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<MemberDTO> memberList = memberDAO.getAllMembers(); // DB에서 모든 회원 데이터를 가져옴

		request.setAttribute("memberList", memberList);
		
		return "/main_admin/adminMemberForm.jsp";
	}

}
