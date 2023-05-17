package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupSelectService {
	static ClupSelectService model = new ClupSelectService();
	public static ClupSelectService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public ClupInfo selectClup(int no) throws Exception {
		SqlSession sqlSession = factory.openSession();
		ClupInfo cl = sqlSession.selectOne("selectClup",no);
		sqlSession.close();
		return cl;
	}
}
