package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.TheaterDTO;


public interface AdTheaterService {
	
	//��ȭ�� ����Ʈ ���
	public List<TheaterDTO> showTheaterList()throws DataAccessException;
	
	//���οȭ�� �����
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//���ο� ��ȭ�� �����- ������ ��������
	public List<String> getLocation()throws DataAccessException;

	//��ȭ�� ����
	public int deleteTheater(int theater_id)throws DataAccessException;
	
}
