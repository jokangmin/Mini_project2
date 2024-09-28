package tour.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tour.bean.TourDTO;

public class TourDAO {
	private static TourDAO tourDAO = new TourDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static TourDAO getInstance() {
		return tourDAO;
	}
	
	public TourDAO() {
		try {
        	Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
        }catch (IOException e){
        	e.printStackTrace();
        }
	}

	public void tourWrite(TourDTO tourDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("tourSQL.tourWrite", tourDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<TourDTO> tourList(Map<String, Integer> map) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<TourDTO> list = sqlSession.selectList("tourSQL.tourList", map); // map을 전달
        sqlSession.close();
        return list;
    }

	public int getListTotal() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int total = sqlSession.selectOne("tourSQL.getListTotal");
		sqlSession.close();
		
		return total;
	}

	
	public void deleteTour(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); 
		sqlSession.delete("tourSQL.deleteTour", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	

	public TourDTO getTourById(int seq) {
		TourDTO tourDTO = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tourDTO = sqlSession.selectOne("tourSQL.getTourById", seq);
		sqlSession.close();
		
		return tourDTO;
	}
	
	public void adjustSeq(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

	    sqlSession.update("tourSQL.adjustSeq", seq);
	    sqlSession.commit();
	    sqlSession.close();
	}

	public void updateTour(TourDTO tourDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("tourSQL.updateTour", tourDTO);
        sqlSession.commit();
        sqlSession.close();
		
	}

}
