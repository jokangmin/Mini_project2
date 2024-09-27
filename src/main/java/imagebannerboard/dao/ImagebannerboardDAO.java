package imagebannerboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imagebannerboard.bean.ImagebannerboardDTO;

public class ImagebannerboardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static ImagebannerboardDAO instance = new ImagebannerboardDAO();
	
	public static ImagebannerboardDAO getInstance() {
		return instance;
	}
	
	public ImagebannerboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void imageboardWrite(ImagebannerboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("adminSQL.imagebannerboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();		
	}

	public List<ImagebannerboardDTO> imagebannerboardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImagebannerboardDTO> list = sqlSession.selectList("adminSQL.imagebannerboardList", map);
		sqlSession.close();
		return list;
	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("adminSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

	public void imageboardDelete(String seq) {
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	        sqlSession.delete("adminSQL.imagebannerboardboardDelete", seq); // 단일 seq 삭제
	        sqlSession.commit();
	        sqlSession.close();
	    }

	public String getImageName(Long valueOf) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String image1;
	    image1 = sqlSession.selectOne("adminSQL.bannerName", valueOf);
	    return image1;
	}

	public void mainbannerboardInsert(String seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("adminSQL.mainbannerboardInsert", seq);
		sqlSession.commit();
		sqlSession.close();	
		
	}

    public List<String> getAllSeq(Map<String, Object> map) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<String> list = null; 
        list = sqlSession.selectList("adminSQL.selectAllseq", map); 
        sqlSession.close(); 
        return list;
    }

	public List<String> getimage1(List<String> arraySeq) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<String> imageList = new ArrayList<>(); 
        
            for (String seq : arraySeq) {
            String image1 = sqlSession.selectOne("adminSQL.selectImage1", seq);
            imageList.add(image1);
            }//for
            
            sqlSession.close(); 
        
            return imageList; 
	}

	public void imagemainboardDelete(String seq) {
	    SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.delete("adminSQL.mainbannerboardDelete", seq); // 단일 seq 삭제
        sqlSession.commit();
        sqlSession.close();
    }

}









