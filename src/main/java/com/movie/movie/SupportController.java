package com.movie.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {
	@RequestMapping(value = "/support.do")
	public String menu() {
		
		return "support";
	}
}
