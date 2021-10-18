package com.bambbang.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

@Controller
public class PdfController {
	
	@Autowired DataSource dataSource;
	@RequestMapping("/empPdf")
	public void empPdf(HttpServletResponse res) throws SQLException, JRException, IOException {
		Connection conn = dataSource.getConnection();
		//소스파일 컴파일하여 저장 : compileReportToFile
		 String jrxmlFile = getClass().getResource("/report/empList2.jrxml").getFile();
		String jasperFile = JasperCompileManager.compileReportToFile( jrxmlFile );
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile, null, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, res.getOutputStream());

	}
	
	@RequestMapping("/empPdf2")
	public String empPdf2(HttpServletResponse res, Model model, @RequestParam(required=false, defaultValue="10") Integer deptno) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("P_DEPTNO", deptno);
		model.addAttribute("filename", "/report/empList2.jrxml");
		model.addAttribute("param", map);
		return "pdfView";
	}
	
	@RequestMapping("/deptPdf")
	public String deptPdf(HttpServletResponse res, Model model) {
		model.addAttribute("filename", "/report/deptList.jrxml");
		return "pdfView";
	}
	
	
}
