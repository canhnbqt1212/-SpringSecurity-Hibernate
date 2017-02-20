package com.qlbvmb.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qlbvmb.beans.Employee;
import com.qlbvmb.repository.EmployeeRepository;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	@Resource
	private EmployeeRepository employeeRepository;
	
	
	@Transactional
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}
}
