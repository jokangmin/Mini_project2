package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String id_save_check = request.getParameter("id_state_check");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		String name = memberDAO.login(id, pwd);

		if ("blocked".equals(name)) {
            return name;
        }

		MemberDTO memberDTO = null;
		String memEmail = "";
		
		request.removeAttribute("save_id");
		request.removeAttribute("check_state");
		
		if (name != null) {
			memberDTO = memberDAO.getMemberId(id);
			if (memberDTO != null) {
	            String Email1 = memberDTO.getEmail1();
	            String Email2 = memberDTO.getEmail2();
	            memEmail = Email1 + "@" + Email2;
	        }
		}
		
		HttpSession session = request.getSession();
		
		 Cookie cookieId = new Cookie("cookie_id", "");
		    cookieId.setPath("/"); // 모든 경로에서 접근 가능
	
		    if (name != null) {
		    	session.setAttribute("memName", name);
		    	session.setAttribute("memEmail", memEmail);
		    	session.setAttribute("id", id);
		   
		        if (id_save_check != null && id_save_check.equals("true")) {
		            // 체크박스가 체크된 경우, 쿠키에 ID 저장
		            cookieId.setValue(id);
		            cookieId.setMaxAge(60 * 60); //쿠키 저장시간 지정
		        } else {
		            // 체크박스가 체크되지 않은 경우, 쿠키 삭제
		        	request.removeAttribute("save_id");
		        	request.removeAttribute("check_state");
		            cookieId.setValue("");
		            cookieId.setMaxAge(0); // 쿠키 즉시 삭제
		        }
		    } else {
		        // 로그인 실패 시 쿠키 삭제
		        cookieId.setMaxAge(0); // 쿠키 즉시 삭제
		    }
		    response.addCookie(cookieId);
		
		request.setAttribute("name", name);
		
		return "/member/memberLogin.jsp";
	}

}
