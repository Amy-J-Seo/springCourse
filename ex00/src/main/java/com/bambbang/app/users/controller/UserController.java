package com.bambbang.app.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	//제일 처음에 시작될 페이지만 하나 만들것임
	@GetMapping("/userPage")
	public String userPage() {
		return "users/users";
	}
}
