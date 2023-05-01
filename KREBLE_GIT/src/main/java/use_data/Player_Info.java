package use_data;

import java.sql.Date;

public class Player_Info {
	String player_name;
	String player_ko_name;
	Date player_birth;
	String player_gender;
	String player_position;
	String player_profile;

	public String getPlayer_name() {
		return player_name;
	}

	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}

	public String getPlayer_ko_name() {
		return player_ko_name;
	}

	public void setPlayer_ko_name(String player_ko_name) {
		this.player_ko_name = player_ko_name;
	}

	public Date getPlayer_birth() {
		return player_birth;
	}

	public void setPlayer_birth(Date player_birth) {
		this.player_birth = player_birth;
	}

	public String getPlayer_gender() {
		return player_gender;
	}

	public void setPlayer_gender(String player_gender) {
		this.player_gender = player_gender;
	}

	public String getPlayer_position() {
		return player_position;
	}

	public void setPlayer_position(String player_position) {
		this.player_position = player_position;
	}

	public String getPlayer_profile() {
		return player_profile;
	}

	public void setPlayer_profile(String player_profile) {
		this.player_profile = player_profile;
	}
}
