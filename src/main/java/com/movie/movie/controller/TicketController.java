package com.movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.dto.TicketDTO;
import com.movie.movie.service.TicketService;


@Controller
public class TicketController {
	@Autowired
	TicketService ticketService;
	@RequestMapping("ticketForm.do")
	public ModelAndView ticketForm(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception {
			Map  movieList=ticketService.ticketForm();
			mv.addObject("movieList",movieList);
			mv.setViewName("ticketForm");
		
		return mv;
	}
}
