package vn.bachgiahuy.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.bachgiahuy.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
// @RestController
public class UserController {
    // dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // @GetMapping("/")
    @RequestMapping("/")
    public String getHomePage() {
        String page = this.userService.handleHelloWorld();
        return "hello";
    }
}
