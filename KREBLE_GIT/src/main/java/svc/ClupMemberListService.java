package svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupMemberListService {
	static ClupMemberListService model = new ClupMemberListService();
	public static ClupMemberListService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public List<ClupInfo> selectMemberList(int no) throws Exception {
		SqlSession sqlSession = factory.openSession();
		List<ClupInfo> sll = sqlSession.selectList("selectMemberList",no);
		sqlSession.close();
		return sll;
	}
}
