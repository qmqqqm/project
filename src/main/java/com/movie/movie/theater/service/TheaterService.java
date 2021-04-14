package com.movie.movie.theater.service;

import java.util.List;

import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterService {

	//영화관 리스트
	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation()throws Exception;

	//영화관 상세 정보
	public TotalSangygDTO totalSangyg(int theater_id)throws Exception;


}
