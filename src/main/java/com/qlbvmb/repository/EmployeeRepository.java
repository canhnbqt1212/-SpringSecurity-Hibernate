package com.qlbvmb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qlbvmb.beans.Employee;

public interface EmployeeRepository extends JpaRepository<Employee,Integer> {

}
