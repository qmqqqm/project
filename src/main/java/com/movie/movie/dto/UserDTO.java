package com.movie.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component("userDTO")
public class UserDTO {
	private int member_id ; 		//회원번호	
	private	String member_name ;	
	private	int member_jumin ;		
	private String member_userid  ; 
	private String member_pwd  ; 
	private String member_email  ; 
	private int member_tel  ; 
	private int member_admin  ;
	private String member_isShow  ;
	
	public UserDTO() {}

	public UserDTO(int member_id, String member_name, int member_jumin, String member_userid, String member_pwd,
			String member_email, int member_tel, int member_admin, String member_isShow) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_jumin = member_jumin;
		this.member_userid = member_userid;
		this.member_pwd = member_pwd;
		this.member_email = member_email;
		this.member_tel = member_tel;
		this.member_admin = member_admin;
		this.member_isShow = member_isShow;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_jumin() {
		return member_jumin;
	}

	public void setMember_jumin(int member_jumin) {
		this.member_jumin = member_jumin;
	}

	public String getMember_userid() {
		return member_userid;
	}

	public void setMember_userid(String member_userid) {
		this.member_userid = member_userid;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(int member_tel) {
		this.member_tel = member_tel;
	}

	public int getMember_admin() {
		return member_admin;
	}

	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}

	public String getMember_isShow() {
		return member_isShow;
	}

	public void setMember_isShow(String member_isShow) {
		this.member_isShow = member_isShow;
	}

	@Override
	public String toString() {
		return "UserDTO [member_id=" + member_id + ", member_name=" + member_name + ", member_jumin=" + member_jumin
				+ ", member_userid=" + member_userid + ", member_pwd=" + member_pwd + ", member_email=" + member_email
				+ ", member_tel=" + member_tel + ", member_admin=" + member_admin + ", member_isShow=" + member_isShow
				+ "]";
	}
	
	
	
}
