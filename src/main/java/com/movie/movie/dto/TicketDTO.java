package com.movie.movie.dto;

import java.util.Date;

public class TicketDTO {
	private int TICKET_id;
	private String member_userid;
	private int movie_id;
	private String movie_title;
	private int theater_id;
	private String theater_name;
	private String theater_location;
	private Date times_time;
	private Date TICKET_DATE;
	private Date TICKET_TIME;
	private int TICKET_PRICE;
	private int TICKET_QUANTITY;  //수량
	private int sangyg_id;
	private String sangyg_name;
	private String TICKET_isshow;
	private int TICKET_SEATS; //예약한 좌석번호
	
	
	public TicketDTO() {}


	public TicketDTO(int tICKET_id, String member_userid, int movie_id, String movie_title, int theater_id,
			String theater_name, String theater_location, Date tICKET_DATE, Date tICKET_TIME, int tICKET_PRICE,
			int tICKET_QUANTITY, int sangyg_id, String sangyg_name, String tICKET_isshow, int tICKET_SEATS) {
		super();
		TICKET_id = tICKET_id;
		this.member_userid = member_userid;
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.theater_id = theater_id;
		this.theater_name = theater_name;
		this.theater_location = theater_location;
		TICKET_DATE = tICKET_DATE;
		TICKET_TIME = tICKET_TIME;
		TICKET_PRICE = tICKET_PRICE;
		TICKET_QUANTITY = tICKET_QUANTITY;
		this.sangyg_id = sangyg_id;
		this.sangyg_name = sangyg_name;
		TICKET_isshow = tICKET_isshow;
		TICKET_SEATS = tICKET_SEATS;
	}


	public int getTICKET_id() {
		return TICKET_id;
	}


	public void setTICKET_id(int tICKET_id) {
		TICKET_id = tICKET_id;
	}


	public String getMember_userid() {
		return member_userid;
	}


	public void setMember_userid(String member_userid) {
		this.member_userid = member_userid;
	}


	public int getMovie_id() {
		return movie_id;
	}


	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}


	public String getMovie_title() {
		return movie_title;
	}


	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}


	public int getTheater_id() {
		return theater_id;
	}


	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}


	public String getTheater_name() {
		return theater_name;
	}


	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}


	public String getTheater_location() {
		return theater_location;
	}


	public void setTheater_location(String theater_location) {
		this.theater_location = theater_location;
	}


	public Date getTICKET_DATE() {
		return TICKET_DATE;
	}


	public void setTICKET_DATE(Date tICKET_DATE) {
		TICKET_DATE = tICKET_DATE;
	}


	public Date getTICKET_TIME() {
		return TICKET_TIME;
	}


	public void setTICKET_TIME(Date tICKET_TIME) {
		TICKET_TIME = tICKET_TIME;
	}


	public int getTICKET_PRICE() {
		return TICKET_PRICE;
	}


	public void setTICKET_PRICE(int tICKET_PRICE) {
		TICKET_PRICE = tICKET_PRICE;
	}


	public int getTICKET_QUANTITY() {
		return TICKET_QUANTITY;
	}


	public void setTICKET_QUANTITY(int tICKET_QUANTITY) {
		TICKET_QUANTITY = tICKET_QUANTITY;
	}


	public int getSangyg_id() {
		return sangyg_id;
	}


	public void setSangyg_id(int sangyg_id) {
		this.sangyg_id = sangyg_id;
	}


	public String getSangyg_name() {
		return sangyg_name;
	}


	public void setSangyg_name(String sangyg_name) {
		this.sangyg_name = sangyg_name;
	}


	public String getTICKET_isshow() {
		return TICKET_isshow;
	}


	public void setTICKET_isshow(String tICKET_isshow) {
		TICKET_isshow = tICKET_isshow;
	}


	public int getTICKET_SEATS() {
		return TICKET_SEATS;
	}


	public void setTICKET_SEATS(int tICKET_SEATS) {
		TICKET_SEATS = tICKET_SEATS;
	}


	@Override
	public String toString() {
		return "TicketDTO [TICKET_id=" + TICKET_id + ", member_userid=" + member_userid + ", movie_id=" + movie_id
				+ ", movie_title=" + movie_title + ", theater_id=" + theater_id + ", theater_name=" + theater_name
				+ ", theater_location=" + theater_location + ", TICKET_DATE=" + TICKET_DATE + ", TICKET_TIME="
				+ TICKET_TIME + ", TICKET_PRICE=" + TICKET_PRICE + ", TICKET_QUANTITY=" + TICKET_QUANTITY
				+ ", sangyg_id=" + sangyg_id + ", sangyg_name=" + sangyg_name + ", TICKET_isshow=" + TICKET_isshow
				+ ", TICKET_SEATS=" + TICKET_SEATS + "]";
	}
	
	
}
