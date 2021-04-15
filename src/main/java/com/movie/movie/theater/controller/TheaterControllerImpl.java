package com.movie.movie.theater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		//1.�Ķ����
		//2.����Ͻ�����
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
	  @RequestMapping("/theaterInform.do")
	  public @ResponseBody Map<String, Object> theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 
	  //1.�Ķ���� �ޱ� 
	  int theater_id = Integer.parseInt(request.getParameter("id"));

	  //2.����Ͻ� ����
	  //2-1. �� �¼��� �� �󿵰� �� �������� (from sangyg) 
	  TotalSangygDTO total = theaterService.totalSangyg(theater_id);
	  
	  //3.
	  Map<String, Object> theaterinform = new HashMap<String,Object>();
	  theaterinform.put("totSangygDTO", total);
	 
	  return theaterinform; 
	  }
	 
}
