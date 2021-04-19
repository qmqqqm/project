package com.movie.movie.theater.dao;

import java.util.List;

import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterDAO {

	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation() throws Exception;

	public TotalSangygDTO getTotal(int theater_id) throws Exception;

	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception;

	public List<MovieDTO> getMovie(List id_list) throws Exception;

	public List<SangygDTO> getSangyg(List sangygList, int theater_id) throws Exception;

}
