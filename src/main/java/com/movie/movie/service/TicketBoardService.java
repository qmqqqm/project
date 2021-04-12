package com.movie.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.TicketBoardDAO;
@Service
public class TicketBoardService {
	@Autowired
	private TicketBoardDAO ticketBoardDAO;
	public void ticketBoardList() {
		ticketBoardDAO.ticketBoardList();
	}

}
