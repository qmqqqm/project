package com.movie.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.dto.TicketDTO;
import com.movie.movie.service.TicketService;


@Controller
public class TicketController {
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private TicketService ticketService;
	@RequestMapping("ticketForm.do")
	public ModelAndView ticketForm(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception {
			Map  movieList=ticketService.ticketForm();
			mv.addObject("movieList",movieList);
			mv.setViewName("ticketForm");
		
		return mv;
	}
	/* 극장선택 아작스 */
	@RequestMapping("theaterchoice.do")	
	public @ResponseBody Map<String, Object> theaterchoice(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String theater_location = request.getParameter("name");
		
		List<TicketDTO> theaterchoice = ticketService.theaterchoice(theater_location);
		
		Map<String, Object> choice = new HashMap<String, Object>();
		choice.put("theaterchoice", theaterchoice);
		System.out.println(theaterchoice);
		return choice;
	}

	/* 사용자 선택한값 처리 아작스 */
	@RequestMapping("userSelect.do")
	public @ResponseBody Map<String, Object> userSelect(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String movieid =request.getParameter("selectmovieid");
		if(movieid!=null){
			int movie_id=Integer.parseInt(movieid);
			ticketDTO.setMovie_id(movie_id);
			}		
		String theaterid = request.getParameter("selecttheaterid");
		if(theaterid!=null){
			int theater_id=Integer.parseInt(theaterid);			
			ticketDTO.setTheater_id(theater_id);
			}	
		String times_time = request.getParameter("selectdayname");	
		System.out.println("times_time"+times_time);
		
		
		ticketDTO.setTimes_time(times_time);
		
		System.out.println("theater"+ticketDTO);
		Map<String, Object> choice = ticketService.userSelect(ticketDTO);
			
		return choice;
	}
	
	
}
