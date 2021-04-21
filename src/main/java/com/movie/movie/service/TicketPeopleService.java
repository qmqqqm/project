package com.movie.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.TicketPeopleDAO;

@Service
public class TicketPeopleService {
	@Autowired
	private TicketPeopleDAO ticketPeopleDAO;
	public int ticketpeople() {
		int stats=ticketPeopleDAO.ticketpeople();
		return stats;
	}

}
