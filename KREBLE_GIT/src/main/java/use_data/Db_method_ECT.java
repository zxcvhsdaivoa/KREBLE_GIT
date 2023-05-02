package use_data;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Db_method_ECT extends Db_method_conn  {
	
	public int select_clup_member_count(int clup_no) throws Exception {
		conn();
		int count=0;
		try{
			ResultSet rs = stm.executeQuery("select count(*) from clup_member where clup_no="+clup_no+";");
			if(rs.next()){
				count=(rs.getInt("count(*)"));
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			diconn();
		}
		return count;
	}
}
