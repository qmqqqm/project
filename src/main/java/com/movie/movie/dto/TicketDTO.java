package com.movie.movie.dto;

import java.util.Date;

public class TicketDTO {
	private int TICKET_id;
	private String member_userid;
	private int movie_id;
	private int theater_id;
	private Date TICKET_DATE;
	private Date TICKET_TIME;
	private int TICKET_PRICE;
	private int TICKET_QUANTITY;  //수량
	private int sangyg_id;
	private String TICKET_isshow;
	private int TICKET_SEATS; //예약한 좌석번호
	private String movie_title;
	
	public TicketDTO() {}
	public TicketDTO(int tICKET_id, String member_userid, int movie_id, int theater_id, Date tICKET_DATE,
			Date tICKET_TIME, int tICKET_PRICE, int tICKET_QUANTITY, int sangyg_id, String tICKET_isshow,
			int tICKET_SEATS, String movie_title) {
		super();
		TICKET_id = tICKET_id;
		this.member_userid = member_userid;
		this.movie_id = movie_id;
		this.theater_id = theater_id;
		TICKET_DATE = tICKET_DATE;
		TICKET_TIME = tICKET_TIME;
		TICKET_PRICE = tICKET_PRICE;
		TICKET_QUANTITY = tICKET_QUANTITY;
		this.sangyg_id = sangyg_id;
		TICKET_isshow = tICKET_isshow;
		TICKET_SEATS = tICKET_SEATS;
		this.movie_title = movie_title;
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
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
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
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	@Override
	public String toString() {
		return "TicketDTO [TICKET_id=" + TICKET_id + ", member_userid=" + member_userid + ", movie_id=" + movie_id
				+ ", theater_id=" + theater_id + ", TICKET_DATE=" + TICKET_DATE + ", TICKET_TIME=" + TICKET_TIME
				+ ", TICKET_PRICE=" + TICKET_PRICE + ", TICKET_QUANTITY=" + TICKET_QUANTITY + ", sangyg_id=" + sangyg_id
				+ ", TICKET_isshow=" + TICKET_isshow + ", TICKET_SEATS=" + TICKET_SEATS + ", movie_title=" + movie_title
				+ "]";
	} 
	
	
	
}
