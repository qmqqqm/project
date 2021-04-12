package com.movie.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.movie.dto.TicketBoardDTO;
import com.movie.movie.service.TicketBoardService;

@Controller("ticketBoardController")
public class TicketBoardController {
	@Autowired
	private TicketBoardService ticketBoardService;
	
	@RequestMapping("ticketBoardList.do")
	public String ticketBoardList( ) {
		ticketBoardService.ticketBoardList();
		return "ticketBoardList";
	}
}
