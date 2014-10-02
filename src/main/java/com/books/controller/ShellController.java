package com.books.controller;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Order(value = Ordered.LOWEST_PRECEDENCE)
public class ShellController {

	@RequestMapping("/**/*")
	public String getPathedShell() {
		System.out.println("ShellController GET /**/*");
		//shell = webapp/WEB-INF/shell.jsp
		//return "shell";
		return "index";
	}
	
	@RequestMapping("/")
	public String getRootShell() {
		System.out.println("ShellController GET /");
		//shell = webapp/WEB-INF/shell.jsp
		//return "shell";
		return "index";
	}
}