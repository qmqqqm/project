package com.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.service.TicketPeopleService;

@Controller
public class TicketPeopleController {
	@Autowired
	private TicketPeopleService ticketPeopleService;
	
	@RequestMapping("ticketPeople.do")
	public ModelAndView ticketpeople(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception {
		int stats=ticketPeopleService.ticketpeople();
		mv.addObject("stats",stats);
		mv.setViewName("ticketPeople");
		return mv;
		
	}
}
