package qna.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import qna.bean.QnaDTO;


public class QnaDAO {
	private static QnaDAO qnaDAO = new QnaDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static QnaDAO getInstance() {
		return qnaDAO;
	}
	
	private QnaDAO() {
        try {
        	Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
        }catch (IOException e){
        	e.printStackTrace();
        }
       
    }
	
	//DAO 부분
	
	// 목록 출력
	public List<QnaDTO> list(int startNum, int endNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            Map<String, Integer> list = new HashMap<>();
            list.put("startNum", startNum);
            list.put("endNum", endNum);
            return sqlSession.selectList("qnaSQL.list", list);
        }
    }
	
	// 총 글 수
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession.selectOne("qnaSQL.getTotalA");
		
	}
	
	// 사용자 문의글 등록
	public void user_write(QnaDTO qnaDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); 
		sqlSession.insert("qnaSQL.user_write", qnaDTO);
		sqlSession.commit();  
		sqlSession.close();
		
	}
	
	//사용자 글 조회 (step 과 ref 값 가져오기)
	public Map<String , Object> getBoardSelect(int seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, Object> Ref_Step = sqlSession.selectOne("qnaSQL.getBoardSelect", seq);
		sqlSession.close();
        return Ref_Step;
	}

	// 관리자 - 답글 작성
	public void update(QnaDTO qnaDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, Object> list = new HashMap<>();
		list.put("seq",qnaDTO.getSeq());
		list.put("qnaAdminContent",qnaDTO.getQnaAdminContent());
		
		sqlSession.update("qnaSQL.update", list);
		sqlSession.commit();
	}
	
	// 체크 안된 글 수
	public int noCheck() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession.selectOne("qnaSQL.noCheck");
	}
	
	
	
}
