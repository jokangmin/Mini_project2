package foodreview.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import foodreview.bean.FoodreviewDTO;


public class FoodreviewDAO {
	private static FoodreviewDAO instance = new FoodreviewDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static FoodreviewDAO getInstance() {
        return instance;
    }
	
	private FoodreviewDAO() {
		try {
        	Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        }catch (IOException e){
        	e.printStackTrace();
        }
	}
	
	public void foodreviewWrite(FoodreviewDTO foodreviewDTO) {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	sqlSession.insert("foodreviewSQL.foodreviewWrite",foodreviewDTO);
    	sqlSession.commit();
		sqlSession.close(); 
    }
	
	 public int getTotal() {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
		int gettotal = sqlSession.selectOne("foodreviewSQL.getTotal");
		sqlSession.close(); 
		return gettotal;
	}
	 
	 public List<FoodreviewDTO> select(int startNum, int endNum){
    	Map<String, Integer> map = new HashMap<>();
    	map.put("startNum",startNum);
    	map.put("endNum",endNum);
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	
    	List<FoodreviewDTO> list = sqlSession.selectList("foodreviewSQL.select", map);
        
		sqlSession.close();  
    	return list;
    }
	 
	 public void ContentHit(int seq) {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	sqlSession.update("foodreviewSQL.ContentHit",seq);
    	sqlSession.commit();
		sqlSession.close(); 
    }
	 
	public FoodreviewDTO contentSelect(int seq) {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	FoodreviewDTO foodreviewDTO = sqlSession.selectOne("foodreviewSQL.contentSelect", seq);
	    sqlSession.close(); 
    	return foodreviewDTO;
    }
	
	public void reviewReport(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("foodreviewSQL.reviewReport", id);
		sqlSession.commit();
		sqlSession.close(); 
	}
	
	public void reviewLike(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("foodreviewSQL.reviewLike", seq);
		sqlSession.commit();
		sqlSession.close(); 
	}
	
	public void reviewDelete(int seq) { //삭제 추가 - 조강민
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("foodreviewSQL.reviewDelete", seq);
		sqlSession.commit();
		sqlSession.close(); 
	}
	
	public void reviewUpdate(FoodreviewDTO foodreviewDTO) { //수정 추가 - 조강민
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("foodreviewSQL.reviewUpdate", foodreviewDTO);
		sqlSession.commit();
		sqlSession.close(); 
	}
	
	public List<FoodreviewDTO> searchFoodReviews(String searchTerm, int startNum, int endNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchTerm", searchTerm);
        params.put("startNum", startNum);
        params.put("endNum", endNum);

        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("foodreviewSQL.searchFoodReviews", params);
        }
    }

    public int getTotalBySearchTerm(String searchTerm) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("foodreviewSQL.getTotalBySearchTerm", searchTerm);
        }
    }

    public List<FoodreviewDTO> searchFoodReviewsByTitle(String searchTerm, int startNum, int endNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchTerm", searchTerm);
        params.put("startNum", startNum);
        params.put("endNum", endNum);

        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("foodreviewSQL.searchFoodReviewsByTitle", params);
        }
    }

    public List<FoodreviewDTO> searchFoodReviewsByContent(String searchTerm, int startNum, int endNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchTerm", searchTerm);
        params.put("startNum", startNum);
        params.put("endNum", endNum);

        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("foodreviewSQL.searchFoodReviewsByContent", params);
        }
    }
    public int getTotalByTitle(String searchTerm) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("foodreviewSQL.getTotalByTitle", searchTerm);
        }
    }

    public int getTotalByContent(String searchTerm) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("foodreviewSQL.getTotalByContent", searchTerm);
        }
    }
	
}
