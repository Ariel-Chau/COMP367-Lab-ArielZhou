package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;

public class Controller {
	@GetMapping("/")
    public String index() {
		System.out.println("Welcome COMP367");
        return "index";
    }
}
