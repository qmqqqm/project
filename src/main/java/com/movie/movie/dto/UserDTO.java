package com.movie.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component("userDTO")
public class UserDTO {
	private int member_no; 		//회원번호	
	private	String member_id;		//회원id
	private	String member_pwd;		//비번 
	private	String member_name;	//회원명 
	private Date member_birth ; /* 생년월일 */
	private String member_gender ; /* 성별 */
	private String member_hp ; /* 휴대전화번호 */
	private int member_point ; /* 포인트 */
	private String member_isshow ;/* 삭제여부 */
	private int member_grade ;/* 회원상태 */
	
	public UserDTO() {}
	
	public UserDTO(int member_no, String member_id, String member_pwd, String member_name, Date member_birth,
			String member_gender, String member_hp, int member_point, String member_isshow, int member_grade) {
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_birth = member_birth;
		this.member_gender = member_gender;
		this.member_hp = member_hp;
		this.member_point = member_point;
		this.member_isshow = member_isshow;
		this.member_grade = member_grade;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_hp() {
		return member_hp;
	}
	public void setMember_hp(String member_hp) {
		this.member_hp = member_hp;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_isshow() {
		return member_isshow;
	}
	public void setMember_isshow(String member_isshow) {
		this.member_isshow = member_isshow;
	}
	public int getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	@Override
	public String toString() {
		return "UserDTO [member_no=" + member_no + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_name=" + member_name + ", member_birth=" + member_birth + ", member_gender=" + member_gender
				+ ", member_hp=" + member_hp + ", member_point=" + member_point + ", member_isshow=" + member_isshow
				+ ", member_grade=" + member_grade + "]";
	}
	
	
	
	
}
