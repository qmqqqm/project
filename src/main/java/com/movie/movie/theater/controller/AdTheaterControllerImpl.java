package com.movie.movie.theater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.service.AdTheaterService;

@Controller("adTheaterController")
public class AdTheaterControllerImpl implements AdTheaterController{
	
	@Autowired
	private AdTheaterService adTheaterService;
	
	@Autowired 
	private TheaterDTO theaterDTO;
	
	//영화관 리스트
	@Override
	@RequestMapping(value = "/showTheaterList.do") 
	public ModelAndView showTheaterList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터 - 없음
		//2.비즈니스로직수행
		List<TheaterDTO> theaterList = adTheaterService.showTheaterList();
		System.out.println("theaterList="+theaterList);
		//3.model
		ModelAndView mv = new ModelAndView("/theater/admin/theaterList");
		
		mv.addObject("theaterList", theaterList);
		//4.view
		return mv;
	}

	//새로운영화관 만들기->form
	@Override
	@RequestMapping("/createTheaterForm.do")
	public ModelAndView  createTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터- 없음
		//2.비즈니스 수행 -1)theater table 에서 지역명을 가져온다.
		List<String> locationList = adTheaterService.getLocation();
		System.out.println(locationList);
		
		//3.model
		ModelAndView mv = new ModelAndView("/theater/admin/createTheater");
		
		mv.addObject("locationList", locationList);
		//4.view
		return mv;
		
		
	}
	//새로운 영화관 만들기 
	@Override
	@RequestMapping("/createTheater.do")
	public ModelAndView createTheater(HttpServletRequest request, HttpServletResponse response,
										@ModelAttribute("info") TheaterDTO theaterDTO) throws Exception {
		//파라미터받기
		
		/*
		 * String theater_location = request.getParameter("location"); String
		 * theater_name = request.getParameter("name"); String theater_address
		 * =request.getParameter("address"); String theater_phone
		 * =request.getParameter("phone");
		 */
		 
		
		//2.비즈니스로직수행
		int result = adTheaterService.createTheater(theaterDTO);
		System.out.println("컨트롤러에서 비즈니스로직결과 result ="+result);
		
		//3.model
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/theater/admin/theaterList");
		//4.view
		return mv;
	}
	
	//영화 삭제하기
	@Override
	@RequestMapping("/deleteTheater.do")
	public ModelAndView deleteTheater(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.파라미터 제대로 받았는지 확인하기
		int theater_id = Integer.parseInt(request.getParameter("theater_id"));
		
		System.out.println(theater_id);
		//2.비즈니스 로직 수행
		int result = adTheaterService.deleteTheater(theater_id);
		System.out.println("result" + result);
		
		//3.model
		ModelAndView mv = new ModelAndView("redirect:showTheaterList.do");
		
		//4.view
		return mv;
	}

	//영화 수정하기
	@Override
	public ModelAndView modifyTheater(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 파라미터
		
		return null;
	}

}
