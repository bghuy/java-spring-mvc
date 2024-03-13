package vn.bachgiahuy.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "Hello World from Spring Boot !";
    }

    @GetMapping("/user")
    public String userPage() {
        return "Hello World from Spring Boot with user !";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Hello World from Spring Boot with admin !";
    }
}
