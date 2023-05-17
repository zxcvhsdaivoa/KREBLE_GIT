package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupMakingService {
	static ClupMakingService model = new ClupMakingService();
	public static ClupMakingService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void making(ClupInfo ci) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int i=sqlSession.insert("makeClup");
		sqlSession.commit();
		sqlSession.close();
	}
}
