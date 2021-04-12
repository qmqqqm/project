package com.movie.movie.service;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.UserDAO;
import com.movie.movie.dto.UserDTO;

@Service("userService")
public class UserService {
	private UserDAO userDAO;
	public UserDTO login(UserDTO userDTO)throws DataAccessException {
		System.out.println(userDTO);
		UserDTO user=userDAO.login(userDTO);
		return user;
	}
	
}
