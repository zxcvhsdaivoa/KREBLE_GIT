package svc;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;

public class ClupUpdateLastdayService {
	static ClupUpdateLastdayService model = new ClupUpdateLastdayService();
	public static ClupUpdateLastdayService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void updateLastday(int no,String id) throws Exception {
		SqlSession sqlSession = factory.openSession();
		sqlSession.selectList("selectSangpum");
		sqlSession.close();
	}
}
