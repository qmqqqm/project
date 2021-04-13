package com.movie.movie.theater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TheaterController {
	//¿µÈ­°ü
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
