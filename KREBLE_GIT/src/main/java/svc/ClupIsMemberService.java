package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupIsMemberService {
	static ClupIsMemberService model = new ClupIsMemberService();
	public static ClupIsMemberService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public String ismember(ClupInfo cl) throws Exception {
		SqlSession sqlSession = factory.openSession();
		String member = sqlSession.selectOne("isMember",cl);
		sqlSession.close();
		return member;
	}
}
