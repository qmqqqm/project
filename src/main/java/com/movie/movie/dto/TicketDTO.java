package com.movie.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TicketDTO {
	private int ticket_id;
	private String member_userid;
	private int movie_id;
	private String movie_title;
	private int theater_id;
	private String theater_name;
	private String theater_location;
	private String times_time;
	private String ticket_date;
	private Date ticket_time;
	private int ticket_price;
	private int ticket_quantity;  //수량
	private int sangyg_id;
	private String sangyg_name;
	private String ticket_isshow;
	private String ticket_seats; //예약한 좌석번호
	
	
	public TicketDTO() {}


	public TicketDTO(int ticket_id, String member_userid, int movie_id, String movie_title, int theater_id,
			String theater_name, String theater_location, String times_time, String ticket_date, Date ticket_time,
			int ticket_price, int ticket_quantity, int sangyg_id, String sangyg_name, String ticket_isshow,
			String ticket_seats) {
		super();
		this.ticket_id = ticket_id;
		this.member_userid = member_userid;
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.theater_id = theater_id;
		this.theater_name = theater_name;
		this.theater_location = theater_location;
		this.times_time = times_time;
		this.ticket_date = ticket_date;
		this.ticket_time = ticket_time;
		this.ticket_price = ticket_price;
		this.ticket_quantity = ticket_quantity;
		this.sangyg_id = sangyg_id;
		this.sangyg_name = sangyg_name;
		this.ticket_isshow = ticket_isshow;
		this.ticket_seats = ticket_seats;
	}


	public int getTicket_id() {
		return ticket_id;
	}


	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
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


	public String getTimes_time() {
		return times_time;
	}


	public void setTimes_time(String times_time2) {
		this.times_time = times_time2;
	}


	public String getTicket_date() {
		return ticket_date;
	}


	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}


	public Date getTicket_time() {
		return ticket_time;
	}


	public void setTicket_time(Date ticket_time) {
		this.ticket_time = ticket_time;
	}


	public int getTicket_price() {
		return ticket_price;
	}


	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}


	public int getTicket_quantity() {
		return ticket_quantity;
	}


	public void setTicket_quantity(int ticket_quantity) {
		this.ticket_quantity = ticket_quantity;
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


	public String getTicket_isshow() {
		return ticket_isshow;
	}


	public void setTicket_isshow(String ticket_isshow) {
		this.ticket_isshow = ticket_isshow;
	}


	public String getTicket_seats() {
		return ticket_seats;
	}


	public void setTicket_seats(String ticket_seats) {
		this.ticket_seats = ticket_seats;
	}


	@Override
	public String toString() {
		return "TicketDTO [ticket_id=" + ticket_id + ", member_userid=" + member_userid + ", movie_id=" + movie_id
				+ ", movie_title=" + movie_title + ", theater_id=" + theater_id + ", theater_name=" + theater_name
				+ ", theater_location=" + theater_location + ", times_time=" + times_time + ", ticket_date="
				+ ticket_date + ", ticket_time=" + ticket_time + ", ticket_price=" + ticket_price + ", ticket_quantity="
				+ ticket_quantity + ", sangyg_id=" + sangyg_id + ", sangyg_name=" + sangyg_name + ", ticket_isshow="
				+ ticket_isshow + ", ticket_seats=" + ticket_seats + "]";
	}


	
}
