package com.movie.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@RequestMapping(value = "/login.do")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/join.do")
	public String join() {
		return "join";
	}
	@RequestMapping(value = "/mynb.do")
	public String mynb() {
		return "mynb";
	}
	@RequestMapping(value = "/clubService.do")
	public String clubService() {
		return "clubService";
	}
	
	
	

}
