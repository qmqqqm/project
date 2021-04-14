package com.movie.movie.theater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;
import com.movie.movie.theater.service.TheaterService;

@Controller("TheaterController")
public class TheaterControllerImpl implements TheaterController{

	@Autowired
	TheaterService theaterService;
	
	@Override
	@RequestMapping("/theater.do")
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.파라미터
		//2.비즈니스수행
		List<String> location = theaterService.getLocation();
		
		List<TheaterDTO> theaters =  theaterService.showTheater();
		System.out.println(theaters);
		
		//3.model
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("theaters", theaters);
		mv.addObject("location", location);
		
		mv.setViewName("/theater/theaters");
		
		return mv;
	}

	@Override
	@ResponseBody
	@RequestMapping("/theaterInform.do")
	public Map theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.파라미터 받기
		int theater_id = Integer.parseInt(request.getParameter("id"));
		System.out.println(theater_id);
		
		Map<String, Object> theaterInform = new HashMap<String, Object>();
		
		//2.비즈니스 수행
		//2-1. 총 좌석수 및 상영관 수 가져오기 (from sangyg)
		TotalSangygDTO total = theaterService.totalSangyg(theater_id);
		System.out.println(total.toString());
		
		theaterInform.put("total", total);
		
		return theaterInform;
	}

}
