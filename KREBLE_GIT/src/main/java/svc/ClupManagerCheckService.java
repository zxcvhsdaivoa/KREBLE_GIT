package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupManagerCheckService {
	static ClupManagerCheckService model = new ClupManagerCheckService();
	public static ClupManagerCheckService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public String isManager(ClupInfo cl) throws Exception {
		SqlSession sqlSession = factory.openSession();
		String manager = sqlSession.selectOne("isManager",cl);
		sqlSession.close();
		return manager;
	}
}
