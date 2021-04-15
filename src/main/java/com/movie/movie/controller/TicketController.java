package com.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.service.TicketService;

@Controller
public class TicketController {
	@Autowired
	private TicketService TicketService; 
	@RequestMapping("ticketForm.do")
	public String ticketForm(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		TicketService.ticketForm();
		return "ticketForm";
	}
}
