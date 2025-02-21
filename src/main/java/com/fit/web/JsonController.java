package com.fit.web;

import com.fit.base.BaseController;
import com.fit.entity.Area;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/13
 */
@Slf4j
@RestController
@RequestMapping("/json")
public class JsonController extends BaseController {

    @RequestMapping(value = "/serialization", method = RequestMethod.GET)
    public Area serialization() {
        Area test = new Area();
        log.info(toJSONString(test));

        return test;
    }

    @RequestMapping(value = "/deserialization")
    @ResponseBody
    public String deserialization(Area test) {
        return test.toString();
    }
}
