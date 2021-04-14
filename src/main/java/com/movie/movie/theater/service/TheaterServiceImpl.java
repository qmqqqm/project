package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.theater.dao.TheaterDAO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

@Service("theaterService")
public class TheaterServiceImpl implements TheaterService{

	@Autowired
	TheaterDAO theaterDAO;
	
	@Override
	public List<TheaterDTO> showTheater() throws Exception {
		List<TheaterDTO> theaters = theaterDAO.showTheater();
		System.out.println(theaters);
		return theaters;
	}

	@Override
	public List<String> getLocation() throws Exception {
		List<String> location = theaterDAO.getLocation();
		return location;
	}
	
	//영화관 상세
	@Override
	public TotalSangygDTO totalSangyg(int theater_id) throws Exception {
		TotalSangygDTO total = theaterDAO.getTotal(theater_id); 
		return total;
	}

}
