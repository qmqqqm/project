package com.movie.movie.theater.service;

import java.util.List;

import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterService {

	//��ȭ�� ����Ʈ
	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation()throws Exception;

	//��ȭ�� �� ����
	public TotalSangygDTO totalSangyg(int theater_id)throws Exception;


}
