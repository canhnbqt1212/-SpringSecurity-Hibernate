package com.qlbvmb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class StateController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/test1")
	public @ResponseBody List<Employee> getAllEmployee(){
		
		return employeeService.findAll();
	}
	
    @RequestMapping("/state1")
    public String getRailwayStationPartialPage(ModelMap modelMap) {
        return "railwaystations/layout";
    }
}
