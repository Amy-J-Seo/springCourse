package com.bambbang.app.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.bambbang.app.Departments;

@Repository//DAO
public interface EmpMapper {
	List<Map> getEmp(String deptid);
	List<Departments> getDept();
	
	@Select("Select sysdate From dual")
	public String getTime();
	
}
