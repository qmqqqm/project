package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.TheaterDTO;


public interface AdTheaterService {
	
	//영화관 리스트 출력
	public List<TheaterDTO> showTheaterList()throws DataAccessException;
	
	//새로운영화관 만들기
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//새로운 영화관 만들기- 지역명 가져오기
	public List<String> getLocation()throws DataAccessException;

	//영화관 삭제
	public int deleteTheater(int theater_id)throws DataAccessException;
	
}
