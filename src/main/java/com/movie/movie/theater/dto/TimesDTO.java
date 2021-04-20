package com.movie.movie.theater.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TimesDTO {
	private int sangyg_id;      
	private int theater_id;   
	private int times_id; 
	private int times_seat; 
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date times_time;  
	
	private String times_isshow;   
	private int movie_id;
	
	
	public TimesDTO() { }
	
	public TimesDTO(int sangyg_id, int theater_id, int times_id, int times_seat, Date times_time, String times_isshow,
			int movie_id) {
		this.sangyg_id = sangyg_id;
		this.theater_id = theater_id;
		this.times_id = times_id;
		this.times_seat = times_seat;
		this.times_time = times_time;
		this.times_isshow = times_isshow;
		this.movie_id = movie_id;
	}

	public int getSangyg_id() {
		return sangyg_id;
	}

	public void setSangyg_id(int sangyg_id) {
		this.sangyg_id = sangyg_id;
	}

	public int getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}

	public int getTimes_id() {
		return times_id;
	}

	public void setTimes_id(int times_id) {
		this.times_id = times_id;
	}

	public int getTimes_seat() {
		return times_seat;
	}

	public void setTimes_seat(int times_seat) {
		this.times_seat = times_seat;
	}

	public Date getTimes_time() {
		return times_time;
	}

	public void setTimes_time(Date times_time) {
		this.times_time = times_time;
	}

	public String getTimes_isshow() {
		return times_isshow;
	}

	public void setTimes_isshow(String times_isshow) {
		this.times_isshow = times_isshow;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	@Override
	public String toString() {
		return "TimesDTO [sangyg_id=" + sangyg_id + ", theater_id=" + theater_id + ", times_id=" + times_id
				+ ", times_seat=" + times_seat + ", times_time=" + times_time + ", times_isshow=" + times_isshow
				+ ", movie_id=" + movie_id + "]";
	}    
	
	
	
	

}
