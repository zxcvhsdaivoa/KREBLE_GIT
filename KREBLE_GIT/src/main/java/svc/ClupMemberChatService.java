package svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupMemberChatService {
	static ClupMemberChatService model = new ClupMemberChatService();
	public static ClupMemberChatService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public List<ClupInfo> selectMemberChat(int no, String id) throws Exception {
		SqlSession sqlSession = factory.openSession();
		List<ClupInfo> sll = sqlSession.selectList("selectClupList");
		sqlSession.close();
		return sll;
	}
}
