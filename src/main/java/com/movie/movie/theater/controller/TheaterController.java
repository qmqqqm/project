package com.movie.movie.theater.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TheaterController {
	//��ȭ��
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//��ȭ ������
	public Map theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
