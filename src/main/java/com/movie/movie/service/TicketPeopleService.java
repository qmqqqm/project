package com.movie.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.TicketPeopleDAO;
import com.movie.movie.dto.TicketDTO;

@Service
public class TicketPeopleService {
	@Autowired
	private TicketPeopleDAO ticketPeopleDAO;
	public int ticketpeople(TicketDTO ticketDTO) {
		int stats=ticketPeopleDAO.ticketpeople(ticketDTO);
		return stats;
	}
	public List<String> selectseat(TicketDTO ticketDTO) {
		List<String> selectseat =ticketPeopleDAO.selectseat(ticketDTO);
		return selectseat;
	}

}
