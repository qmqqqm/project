package com.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TicketPaymentController {
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
}
