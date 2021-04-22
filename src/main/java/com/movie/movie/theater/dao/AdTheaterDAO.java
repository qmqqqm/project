package com.movie.movie.theater.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.TheaterDTO;


public interface AdTheaterDAO {

	//새로운 영화관 만들기-지역명 가져오기
	public List<String> selectLocation() throws DataAccessException;

	//새로운 영화관 만들기
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//영화관 목록 보여주기
	public List<TheaterDTO> selectTheater() throws DataAccessException;

	//영화관 삭제하기
	public int deleteTheater(int theater_id) throws DataAccessException;


}
