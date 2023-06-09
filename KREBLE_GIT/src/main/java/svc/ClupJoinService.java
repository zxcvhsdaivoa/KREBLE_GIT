package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupJoinService {
	
	static ClupJoinService model = new ClupJoinService();
	public static ClupJoinService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void join(ClupInfo cl) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int i= sqlSession.insert("joinClup",cl);
		if(i>0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
	}
	
}