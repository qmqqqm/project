package com.movie.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GiftShopController {
	@RequestMapping("giftShop")
	public String giftShopForm() {
		
		return "giftShopForm";
	}

}
