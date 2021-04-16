package com.movie.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.dto.TicketBoardDTO;
import com.movie.movie.service.TicketBoardService;


@Controller("ticketBoardController")
public class TicketBoardController {
	@Autowired
	private TicketBoardService ticketBoardService;
	@Autowired
	private TicketBoardDTO ticketBoardDTO;
	@RequestMapping("ticketBoardList.do")
	public ModelAndView ticketBoardList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		List<TicketBoardDTO> ticketList=ticketBoardService.ticketBoardList();
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketList",ticketList);
		mv.setViewName("ticketBoardList");
		System.out.println(ticketList);
		return mv;
	}
	@RequestMapping("ticketBoardDetail.do")
	public ModelAndView ticketBoardDetail (@RequestParam("ticketBoard_id") String ticketBoard_id,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		TicketBoardDTO ticketDetail=ticketBoardService.ticketBoardDetail(ticketBoard_id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketDetail",ticketDetail);
		mv.setViewName("ticketBoardDetail");
		return mv;
	}
}
