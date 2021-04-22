package com.movie.movie.theater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TheaterDTO;



public interface AdTheaterController {

	//새로운영화관 만들기->form
	public ModelAndView  createTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//새로운 영화관 만들기
	public ModelAndView createTheater(HttpServletRequest request, HttpServletResponse response, TheaterDTO theaterDTO)
			throws Exception;
	
	//영화 삭제하기
	public ModelAndView deleteTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//영화 수정하기
	public ModelAndView modifyTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//영화관 리스트
	public ModelAndView showTheaterList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	

}
