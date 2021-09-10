package com.bambbang.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.emp.domain.JobsVO;
import com.bambbang.app.emp.mapper.JobsMapper;

@Service
public class JobsServiceImpl implements JobsService {
	@Autowired JobsMapper jobsMapper;
	@Override
	public List<JobsVO> getJobList() {
		return jobsMapper.getJobList();
	}

}
