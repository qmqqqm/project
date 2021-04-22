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

	//�󿵽ð�ǥ 
	@Override
	@RequestMapping("/theaterTimes.do")
	public  @ResponseBody Map<String, Object> theaterTimes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.�Ķ���� �ޱ�
		System.out.println("theaterTimes controller ���� ����");
		int theater_id = Integer.parseInt(request.getParameter("id"));
		String day = request.getParameter("day");
		
		System.out.println("�����ȣ = "  + theater_id + "��¥ = " + day);
		
		
		//2.����Ͻ� ��������
		//2-1. �󿵽ð�ǥ���̺��� �ش� ����,��¥�� �����͵��� �����´�.
		List<TimesDTO> times = theaterService.getTimes(theater_id, day);
		
		
		//2-2. ��ȭ ������ �������µ�, ������ ��ȭ��ȣ �ߺ� �����ؾ��Ѵ�.
		List<Integer> imsi = new ArrayList<Integer>();
		for(int i = 0; i < times.size(); i++) {
			imsi.add(times.get(i).getMovie_id());
		}
		
		HashSet<Integer> imsiSet = new HashSet<Integer>(imsi);
		List<Integer> movieList = new ArrayList<Integer>(imsiSet);
		System.out.println(movieList);
		
		List<MovieDTO> movieInform = theaterService.movieInform(movieList);

		//2-3. �󿵰� ����, �󿵰� ���� ��������(�ߺ� ����)
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
	//팝업창 띄우기
	@RequestMapping("/theaterpopup.do")
	@Override
	public ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<String> locationList = theaterService.getLocation();
		mv.addObject("locationList", locationList);
		mv.setViewName("/theater/popup");
		return mv;
	}
	//팝업창에서 사용하는 아작스(극장정보 받아옴)
	@RequestMapping("/theaterpopuploc.do")
	@Override
	public @ResponseBody Map<String, Object> ajxPopUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theater_location = request.getParameter("location");
		System.out.println(theater_location);
		List<String> theList = theaterService.theNumber(theater_location);
		System.out.println(theList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theList",theList);
		return map;
	}


	 
}
