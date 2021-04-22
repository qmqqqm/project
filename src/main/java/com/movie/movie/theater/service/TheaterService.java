package com.movie.movie.theater.service;

import java.util.List;

import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterService {

	//��ȭ�� ����Ʈ
	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation() throws Exception;

	//��ȭ�� �� ����
	public TotalSangygDTO totalSangyg(int theater_id) throws Exception;

	//�󿵽ð�ǥ
	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception;

	//��ȭ�� ����
	public List<MovieDTO> movieInform(List id_list) throws Exception;

	//�󿵰� ����
	public List<SangygDTO> sangygInform(List sangygList, int theater_id)throws Exception;
	
	
	//위치를 통해 극장번호 받아오기
	public List<String> theNumber(String theater_location)throws Exception;


}
