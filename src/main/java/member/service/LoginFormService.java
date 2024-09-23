package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class LoginFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String save_id = "";
		boolean check_state = false; // 체크박스 체크 상태
		Cookie[] cookies = request.getCookies(); //특정 쿠키를 가져오지 못하고 모든 쿠키를 가져온다
		if (cookies != null) {
			for (Cookie c : cookies) {
				String name = c.getName(); // 쿠키 이름 가져오기
				String value = c.getValue(); // 쿠키 값 가져오기
				if (name.equals("cookie_id")) { // 원하는 쿠키 이름인 경우
					save_id = value; // 저장된 ID 값 가져오기
					check_state = true; // 쿠키가 있으면 체크박스 체크 상태 설정
				}
			}
		}
		
		request.setAttribute("save_id",save_id);
		request.setAttribute("check_state",check_state);
		
		return "/member/memberLoginForm.jsp";
	}

}
