package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupMemberService {
	static ClupMemberService model = new ClupMemberService();
	public static ClupMemberService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public ClupInfo selectMember(ClupInfo member) throws Exception {
		SqlSession sqlSession = factory.openSession();
		ClupInfo cl = sqlSession.selectOne("selectMember",member);
		sqlSession.close();
		return cl;
	}
}
