package com.bambbang.app.secutiry;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

//교재 638페이지
@Component("customLogin")
@Log
public class CustomloginSuccessHandeler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("=========================");
		log.info("login handler 실행");
		List<String> roleNames= new ArrayList<String>();
		authentication.getAuthorities().forEach(authority->{roleNames.add(authority.getAuthority());});
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("admin/admin.jsp");
		}else if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("user/user.jsp");
		}else {
			response.sendRedirect("top.jsp");
		}
	}

}
