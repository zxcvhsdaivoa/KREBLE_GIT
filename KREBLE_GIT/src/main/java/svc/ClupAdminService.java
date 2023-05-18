package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupAdminService {
	
	static ClupAdminService model = new ClupAdminService();
	public static ClupAdminService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public void admin(ClupInfo ci) throws Exception {
		SqlSession sqlSession = factory.openSession();
		int i= sqlSession.insert("rank_admin",ci);
		if(i>0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
	}

}