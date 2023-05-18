package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupLastdateService {
	static ClupLastdateService model = new ClupLastdateService();
	public static ClupLastdateService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void lastdate(ClupInfo ci) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int i=sqlSession.update("lastDate");
		if(i>0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
	}

}
