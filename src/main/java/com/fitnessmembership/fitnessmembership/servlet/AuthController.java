package com.fitnessmembership.fitnessmembership.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/home")
    public String home() {

        return "home";
    }
}