package com.haegisoft.springbootrestservice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class Controller {

    @GetMapping("/hello-world")
    String helloWorld() {
        log.info("helloWorld called.");
        return "Hello New World!";
    }
    @GetMapping("/hello-world/{number}")
    String helloWorld(@PathVariable Long number) {
        log.info("helloWorld called with number: " + number);
        return "Hello New World! Here's the number: "+ number;
    }
}
