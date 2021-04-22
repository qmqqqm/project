package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.theater.dao.AdTheaterDAO;
import com.movie.movie.theater.dto.TheaterDTO;


@Service("adTheaterService")
public class AdTheaterServiceImpl implements AdTheaterService{
	@Autowired
	private AdTheaterDAO adtheaterDAO;

	//영화관 목록 보여주기
	@Override
	public List<TheaterDTO> showTheaterList() throws DataAccessException {
		List<TheaterDTO> theaterList = adtheaterDAO.selectTheater();
		System.out.println(" theaterList ="+ theaterList );
		return theaterList;
	}

	//영화관 지역명 리스트 가져오기
	@Override
	public List<String> getLocation() throws DataAccessException {
		List<String> locationList = adtheaterDAO.selectLocation();
		return locationList;
	}
	
	//영화관 생성
	@Override
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = adtheaterDAO.createTheater(theaterDTO);
		return result;
	}
	
	//영화관 삭제하기
	@Override
	public int deleteTheater(int theater_id) throws DataAccessException {
		int result = adtheaterDAO.deleteTheater(theater_id);
		return result;
	}


}
