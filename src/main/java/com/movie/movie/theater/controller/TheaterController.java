package com.movie.movie.theater.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterController {
	//��ȭ��
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//��ȭ ������
	public  Map<String, Object> theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//��ȭ �󿵽ð�ǥ 
	public  Map<String, Object> theaterTimes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//팝업창여는 컨트롤러
	public  ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//팝업창에서 사용하는 아작스(극장정보 받아옴)
	public Map<String, Object> ajxPopUp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	/*
	 * //��ȭ���� �������� public Map<String, Object> movieInform(HttpServletRequest
	 * request, HttpServletResponse response) throws Exception;
	 */
}
