package com.movie.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component("ticketBoardDTO")
public class TicketBoardDTO {
private int ticketBoard_id;
private String ticketBoard_group;
private String ticketBoard_title;
private Date ticketBoard_regDate;
private Date ticketBoard_modiDate;
private int ticketBoard_readcount;
private String ticketBoard_content;

public TicketBoardDTO() {}
public TicketBoardDTO(int ticketBoard_id, String ticketBoard_group, String ticketBoard_title, Date ticketBoard_regDate,
		Date ticketBoard_modiDate, int ticketBoard_readcount, String ticketBoard_content) {
	super();
	this.ticketBoard_id = ticketBoard_id;
	this.ticketBoard_group = ticketBoard_group;
	this.ticketBoard_title = ticketBoard_title;
	this.ticketBoard_regDate = ticketBoard_regDate;
	this.ticketBoard_modiDate = ticketBoard_modiDate;
	this.ticketBoard_readcount = ticketBoard_readcount;
	this.ticketBoard_content = ticketBoard_content;
}
public int getTicketBoard_id() {
	return ticketBoard_id;
}
public void setTicketBoard_id(int ticketBoard_id) {
	this.ticketBoard_id = ticketBoard_id;
}
public String getTicketBoard_group() {
	return ticketBoard_group;
}
public void setTicketBoard_group(String ticketBoard_group) {
	this.ticketBoard_group = ticketBoard_group;
}
public String getTicketBoard_title() {
	return ticketBoard_title;
}
public void setTicketBoard_title(String ticketBoard_title) {
	this.ticketBoard_title = ticketBoard_title;
}
public Date getTicketBoard_regDate() {
	return ticketBoard_regDate;
}
public void setTicketBoard_regDate(Date ticketBoard_regDate) {
	this.ticketBoard_regDate = ticketBoard_regDate;
}
public Date getTicketBoard_modiDate() {
	return ticketBoard_modiDate;
}
public void setTicketBoard_modiDate(Date ticketBoard_modiDate) {
	this.ticketBoard_modiDate = ticketBoard_modiDate;
}
public int getTicketBoard_readcount() {
	return ticketBoard_readcount;
}
public void setTicketBoard_readcount(int ticketBoard_readcount) {
	this.ticketBoard_readcount = ticketBoard_readcount;
}
public String getTicketBoard_content() {
	return ticketBoard_content;
}
public void setTicketBoard_content(String ticketBoard_content) {
	this.ticketBoard_content = ticketBoard_content;
}
@Override
public String toString() {
	return "TicketBoardDTO [ticketBoard_id=" + ticketBoard_id + ", ticketBoard_group=" + ticketBoard_group
			+ ", ticketBoard_title=" + ticketBoard_title + ", ticketBoard_readcount=" + ticketBoard_readcount
			+ ", ticketBoard_content=" + ticketBoard_content + "]";
}




}
