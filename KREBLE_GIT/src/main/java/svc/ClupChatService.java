package svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupChatService {
	static ClupChatService model = new ClupChatService();
	public static ClupChatService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public List<ClupInfo> selectChat(int no) throws Exception {
		List<ClupInfo> sll = null;
		SqlSession sqlSession = factory.openSession();
		sll = sqlSession.selectList("selectSangpum");
		sqlSession.close();
		return sll;
	}
}
