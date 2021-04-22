package com.movie.movie.theater.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.TheaterDTO;


public interface AdTheaterDAO {

	//���ο� ��ȭ�� �����-������ ��������
	public List<String> selectLocation() throws DataAccessException;

	//���ο� ��ȭ�� �����
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//��ȭ�� ��� �����ֱ�
	public List<TheaterDTO> selectTheater() throws DataAccessException;

	//��ȭ�� �����ϱ�
	public int deleteTheater(int theater_id) throws DataAccessException;


}
