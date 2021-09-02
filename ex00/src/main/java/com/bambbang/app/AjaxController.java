package com.bambbang.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //@Controller + @ResponseBody
public class AjaxController {

	@RequestMapping("/ex08")
	public List<SampleVO> ex08() {
		List<SampleVO> list = new ArrayList<SampleVO>();
		list.add(new SampleVO("aa",10, new Date()));
		list.add(new SampleVO("bb",10, new Date()));
		list.add(new SampleVO("cc",10, new Date()));
		return list;
	}
	
	@RequestMapping("/ex07")
	public SampleVO ex07(SampleVO sample) {
		//SampleVO sample = new SampleVO();
		sample.setName("홍길동");
		sample.setAge(50);
		return sample;
	}
}
