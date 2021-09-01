package com.bambbang.app.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bambbang.app.Departments;

@Repository//DAO
public interface EmpMapper {
	List<Map> getEmp();
	List<Departments> getDept();
}
