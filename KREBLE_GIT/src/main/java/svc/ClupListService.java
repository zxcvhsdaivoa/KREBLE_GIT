package svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupListService {
	static ClupListService model = new ClupListService();
	public static ClupListService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	

	public List<ClupInfo> selectClupList() throws Exception {
		SqlSession sqlSession = factory.openSession();
		List<ClupInfo> sll = sqlSession.selectList("selectClupList");
		sqlSession.close();
		return sll;
	}
}
