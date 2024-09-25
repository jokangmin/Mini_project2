package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;


public class MemberDAO {
    private static MemberDAO memberDAO = new MemberDAO();
	private SqlSessionFactory sqlSessionFactory;

    public static MemberDAO getInstance() {
        return memberDAO;
    }

    private MemberDAO() {
        try {
        	Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
        }catch (IOException e){
        	e.printStackTrace();
        }
       
    }
    
    
    public boolean isExistId(String id) {
    	boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);	
		if(memberDTO == null) {
			exist = true;
		}
		sqlSession.close();
        return exist;
    }
    
    public void insert(MemberDTO memberDTO) { //회원가입
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	sqlSession.insert("memberSQL.insert", memberDTO);
    	sqlSession.commit();
		sqlSession.close();
	}
    
    public String login(String id, String pwd) { // 로그인
    	Map<String, String> map = new HashMap<>();
    	map.put("id",id);
    	map.put("pwd",pwd);
    	SqlSession sqlSession = sqlSessionFactory.openSession();
		String name = "";
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		if(memberDTO != null) {
			name = memberDTO.getName();
		}
		sqlSession.close();
		return name;
	}
    
    public MemberDTO getMemberId(String id) { // 정보 가지고오기
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMemberId", id);
		sqlSession.close();
		return memberDTO;
	}
    
    public void update(MemberDTO memberDTO, String id) { //회원정보수정
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	memberDTO.setId(id);
    	sqlSession.update("memberSQL.update",memberDTO);
		sqlSession.commit();
		sqlSession.close();
       
	}

	public String getPwdById(String id) { //회원 삭제
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String pwd = sqlSession.selectOne("memberSQL.getPwdById", id);
		sqlSession.close();
		
		return pwd;
	}

	public int deleteMem(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.delete("memberSQL.deleteMem", id);
		sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
}
