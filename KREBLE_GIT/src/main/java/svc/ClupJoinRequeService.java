package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupJoinRequeService {
	static ClupJoinRequeService model = new ClupJoinRequeService();
	public static ClupJoinRequeService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void joinReque(ClupInfo cl) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int i= sqlSession.insert("requestJoinClup",cl);
		if(i>0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
	}
}
