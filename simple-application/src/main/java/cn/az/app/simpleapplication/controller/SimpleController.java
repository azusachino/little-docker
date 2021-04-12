package cn.az.app.simpleapplication.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author az
 * @since 2021-04-12 10:40
 */
@RestController
@RequestMapping("/simple")
public class SimpleController {

    @GetMapping
    public String index() {
        return "Hello Docker";
    }
}
