package com.movie.movie.theater.service;

import java.util.List;

import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterService {

	//영화관 리스트
	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation() throws Exception;

	//영화관 상세 정보
	public TotalSangygDTO totalSangyg(int theater_id) throws Exception;

	//상영시간표
	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception;

	//영화관 정보
	public List<MovieDTO> movieInform(List id_list) throws Exception;

	//상영관 정보
	public List<SangygDTO> sangygInform(List sangygList, int theater_id)throws Exception;


}
