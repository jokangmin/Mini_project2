package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;
import member.dao.MemberDAO;

public class checkPwdService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        String inputPwd = request.getParameter("pwd");
        System.out.println("Input Password: " + inputPwd);
        
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        System.out.println("Session ID: " + id);

        MemberDAO memberDAO = MemberDAO.getInstance();
        String MemPwd = memberDAO.getPwdById(id);
        
        System.out.println("MemPwd: " + MemPwd);

        if (MemPwd != null && MemPwd.equals(inputPwd)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }

        return "none";
    }
}
