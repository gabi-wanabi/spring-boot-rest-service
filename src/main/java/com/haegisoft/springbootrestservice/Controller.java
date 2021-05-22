package com.haegisoft.springbootrestservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/hello-world")
    String helloWorld() {
        return "Hello New World!";
    }

}
