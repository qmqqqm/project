package com.movie.movie.theater.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TimesDTO;
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
	  @RequestMapping("/theaterInform.do")
	  public @ResponseBody Map<String, Object> theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 
	  //1.파라미터 받기 
	  int theater_id = Integer.parseInt(request.getParameter("id"));

	  //2.비즈니스 수행
	  //2-1. 총 좌석수 및 상영관 수 가져오기 (from sangyg) 
	  TotalSangygDTO total = theaterService.totalSangyg(theater_id);
	  
	  //3.
	  Map<String, Object> theaterinform = new HashMap<String,Object>();
	  theaterinform.put("totSangygDTO", total);
	 
	  return theaterinform; 
	  }

	//상영시간표 
	@Override
	@RequestMapping("/theaterTimes.do")
	public  @ResponseBody Map<String, Object> theaterTimes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.파라미터 받기
		System.out.println("theaterTimes controller 진입 성공");
		int theater_id = Integer.parseInt(request.getParameter("id"));
		String day = request.getParameter("day");
		
		System.out.println("극장번호 = "  + theater_id + "날짜 = " + day);
		
		
		//2.비즈니스 로직수행
		//2-1. 상영시간표테이블에서 해당 극장,날짜의 데이터들을 가져온다.
		List<TimesDTO> times = theaterService.getTimes(theater_id, day);
		
		
		//2-2. 영화 정보를 가져오는데, 사전에 영화번호 중복 제거해야한다.
		List<Integer> imsi = new ArrayList<Integer>();
		for(int i = 0; i < times.size(); i++) {
			imsi.add(times.get(i).getMovie_id());
		}
		
		HashSet<Integer> imsiSet = new HashSet<Integer>(imsi);
		List<Integer> movieList = new ArrayList<Integer>(imsiSet);
		System.out.println(movieList);
		
		List<MovieDTO> movieInform = theaterService.movieInform(movieList);

		//2-3. 상영관 별로, 상영관 정보 가져오기(중복 제거)
		for(int i = 0; i < times.size(); i++) {
			imsi.add(times.get(i).getSangyg_id());
		}
		imsiSet = new HashSet<Integer>(imsi);
		List<Integer> sangygList = new ArrayList<Integer>(imsiSet);
		System.out.println(sangygList);
		
		List<SangygDTO> sangygInform = theaterService.sangygInform(sangygList,theater_id);
		
		//3.model
		Map<String, Object> theaterTimes = new HashMap<String,Object>();
		theaterTimes.put("times",times);
		theaterTimes.put("movieInform", movieInform);
		theaterTimes.put("sangygInform", sangygInform);
		
		return theaterTimes;
	}


	 
}
