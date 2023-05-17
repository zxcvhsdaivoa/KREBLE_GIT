package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupPWckService {
	static ClupPWckService model = new ClupPWckService();
	public static ClupPWckService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public int pwcheck(ClupInfo cl) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int check = sqlSession.selectOne("clupPWCheck",cl);
		sqlSession.close();
		return check;
	}
}
