package com.movie.movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.TicketDAO;
import com.movie.movie.dto.TicketDTO;
@Service
public class TicketService {
	@Autowired
	TicketDAO ticketDAO;
	public Map ticketForm() {
		Map  movieList = new HashMap();		
		movieList.put("movies", ticketDAO.ticketForm());
		return movieList;
	}

}
