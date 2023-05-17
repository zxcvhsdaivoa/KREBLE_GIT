package svc;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.ClupInfo;

public class ClupNoticeService {
	static ClupNoticeService model = new ClupNoticeService();
	public static ClupNoticeService instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	public List<ClupInfo> selectNotice(int no) throws Exception {
		SqlSession sqlSession = factory.openSession();
		List<ClupInfo> sll = sqlSession.selectList("selectNoticeList",no);
		sqlSession.close();
		return sll;
	}
}
