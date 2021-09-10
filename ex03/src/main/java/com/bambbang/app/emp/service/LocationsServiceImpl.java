package com.bambbang.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bambbang.app.emp.domain.LocationsVO;
import com.bambbang.app.emp.mapper.LocationsMapper;

public class LocationsServiceImpl implements LocationsService {

	
	@Autowired LocationsMapper locationsMapper;
	
	@Override
	public List<LocationsVO> getLocList() {
		return locationsMapper.getLocList();
	}

}
