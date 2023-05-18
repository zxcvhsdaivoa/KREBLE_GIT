package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupLastnoService {
	
	static ClupLastnoService model = new ClupLastnoService();
	public static ClupLastnoService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public int lastno() throws Exception {
		SqlSession sqlSession = factory.openSession();
		int lastno = sqlSession.selectOne("clupLastNo");
		sqlSession.close();
		return lastno;
	}

}
