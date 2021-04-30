package com.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.dto.TicketDTO;
import com.movie.movie.service.TicketPaymentService;

@Controller
public class TicketPaymentController {
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private TicketPaymentService ticketPaymentService; 
	
	@RequestMapping("ticketpayment.do")
	public ModelAndView ticketpayment(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception{
		String price=request.getParameter("price");
		String seat=request.getParameter("seat");
		mv.addObject("price",price);
		mv.addObject("seat",seat);	
		mv.setViewName("ticketpayment");
		return mv;
	}
	@RequestMapping("ticketComplete.do")
	public ModelAndView ticketComplete(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception{
		int ticket_price=Integer.parseInt(request.getParameter("price"));
		String ticket_seats=request.getParameter("seat");
		ticketDTO.setTicket_price(ticket_price);
		ticketDTO.setTicket_seats(ticket_seats);
		ticketPaymentService.ticketComplete(ticketDTO);
		mv.setViewName("main");
		return mv;
	}
}
