package com.movie.movie.theater.dao;

import java.util.List;

import com.movie.movie.theater.dto.TheaterDTO;

public interface TheaterDAO {

	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation() throws Exception;

}
