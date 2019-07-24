package com.jpasample.controllers;

import com.jpasample.dao.HiberDAO;
import com.jpasample.model.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class MyService {
    @Autowired
    HiberDAO hiberDAO;


    public List<Application> filterApplications (String params){
        if (params.equals("end")){
           return hiberDAO.getApplFilter("END");
        }else if (params.equals("tariff")){
            return hiberDAO.getApplFilter("SELECTTARIFF");
        }else if (params.equals("ci")){
            return hiberDAO.getApplFilter("CheckCI");
        }
        else if (params.equals("issue")){
            return hiberDAO.getApplFilter("ISSUE");
        }else {
            return  hiberDAO.getAllApplications();
        }
    }

}
