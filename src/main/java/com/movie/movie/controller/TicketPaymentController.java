package com.movie.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TicketPaymentController {
	@RequestMapping("ticketpayment.do")
	public String ticketpayment() {
		return "ticketpayment";
	}
}
