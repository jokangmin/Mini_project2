package qna.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import qna.bean.QnaDTO;
import qna.dao.QnaDAO;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession(); 
	    String userID = (String) session.getAttribute("id");
	    //int seq = Integer.parseInt(request.getParameter("seq"));
	    
	    String qna_UserContent = request.getParameter("qna_UserContent");
	    String isSecret = request.getParameter("is_secret");
	    
		 
		System.out.println("내용: " + qna_UserContent); 
		System.out.println("비밀글 여부: " + isSecret);
		
	    
	    QnaDTO qnaDTO = new QnaDTO();
	    qnaDTO.setQnaId(userID);
	    qnaDTO.setQnaUserContent(qna_UserContent);
	    String qnaCheck = (isSecret != null && isSecret.equals("true")) ? "T" : "F";
        qnaDTO.setQnaCheck(qnaCheck);
	    
        QnaDAO qnaDAO = QnaDAO.getInstance();
        qnaDAO.user_write(qnaDTO);
	    
	    request.setAttribute("userID", userID); // 작성자
	    
		return "none";
	}

}
