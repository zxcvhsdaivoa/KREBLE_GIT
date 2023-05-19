package vo;


public class AlarmInfo {
	String user_id;
	int alarm_view;
	String alarm_type;
	int alarm_no;
	String alarm_time;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAlarm_view() {
		return alarm_view;
	}
	public void setAlarm_view(int alarm_view) {
		this.alarm_view = alarm_view;
	}
	public String getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(String alarm_type) {
		this.alarm_type = alarm_type;
	}
	public int getAlarm_no() {
		return alarm_no;
	}
	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}
	public String getAlarm_time() {
		return alarm_time;
	}
	public void setAlarm_time(String alarm_time) {
		this.alarm_time = alarm_time;
	}
}
