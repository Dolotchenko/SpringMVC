package com.jpasample.controllers;


import com.jpasample.dao.HiberDAO;
import com.jpasample.model.Application;
import com.jpasample.model.Cat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController

public class MyRestController {
    @Autowired
    HiberDAO hiberDAO;

    @RequestMapping(value = "/allapplications", method = RequestMethod.GET, produces = {"application/json"})
    List<Application> getAllAppl() {
        return hiberDAO.getAllApplications();
    }

    @RequestMapping(value = "/appldel/{id}", method = RequestMethod.DELETE)
    Application delCatObj(@PathVariable("id") long id) {
        return hiberDAO.delApplById(id);
    }
}
