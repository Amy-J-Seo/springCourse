package com.bambbang.app;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.java.Log;

//POJO 아무것도 상속 받을 필요 없다.
//그런데 이것이 컨트롤러로 사용된다는 것을 알려줘야함.
@Log
@Controller // ->@Component 를 상속 !@Controller, @Service @Repository(=dao)
//각각의 용도에 따라 사용이 다르다.
@RequestMapping("/sample/*")
public class SampleController {
	
	@RequestMapping("/ex09")
	@ResponseBody
	public SampleVO ex07(SampleVO sample) {
		//SampleVO sample = new SampleVO();
		sample.setName("홍길동");
		sample.setAge(50);
		return sample;
	}
	
	
	@RequestMapping("/ex06/{name}/{age}")
	public void ex06(@PathVariable String name,
					@PathVariable String age) {
		log.info("name    ="+name);
		log.info("age    ="+age);

	}
	
	
	@RequestMapping("/ex05")
	public void ex05(SampleVoList list) {
		log.info(list.toString());
	}
	
	@RequestMapping("/ex04")
	public void ex04(@RequestParam List<String> ids) {
		log.info(ids.toString());
	}
	
	@RequestMapping("/ex03")
	public void ex03(@RequestParam List<String> ids) {
	//public void ex03(@RequestParam String[] ids) {
		//Stringp[ ids = request.getParameterValues("ids"); 랑 같다
		//log.info(Arrays.toString(ids));
		log.info(ids.toString());
	}
	
	@GetMapping("/ex02")
	public void ex02(@RequestParam(name="username") String name, 
					@RequestParam(required = false, defaultValue = "10") int age) {   //dto?= vo?= do 다 같은 말이래 
		//String name = request.getparameter("name");
		log.info("name:    "+  name);
		log.info("age:    "+  age);
	}
	
	@GetMapping("/ex01")
	public String ex01(@ModelAttribute("sam") SampleVO vo, Model model) {   //dto?= vo?= do 다 같은 말이래 
		log.info(vo.toString());
		//model.addAtribute("sampeVO", vo); 이렇게 해 주지 않아도 알아서 들어간다.
		//이거 해 주지 않아도 파라미터는 알아서 잘 들어간다.
		model.addAttribute("pageNo", "10");
		return "sample/ex01";
	}
	
	
	//@RequestMapping(value="/a", method = RequestMethod.POST)
	@GetMapping("/a")
	public String basic1() {   //jsp 뷰페이지 리턴
		log.info("basic.....................1111");
		return "sample/basica";
	}
	@RequestMapping("/b")
	public void basic2() {   //void 인 경우 url 과 일치하는 뷰페이지로 포워드
		log.info("basic.....................22222");
	}
}
