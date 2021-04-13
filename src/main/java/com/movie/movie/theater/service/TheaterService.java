package com.movie.movie.theater.service;

import java.util.List;

import com.movie.movie.theater.dto.TheaterDTO;

public interface TheaterService {

	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation()throws Exception;


}
