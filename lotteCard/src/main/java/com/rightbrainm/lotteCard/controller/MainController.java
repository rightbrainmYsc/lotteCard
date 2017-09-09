package com.rightbrainm.lotteCard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MainController {

	@RequestMapping(value="/")
	public String Main() {

		return "index";
	}


	@RequestMapping(value="/fileUpload")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, MultipartFile file) {

		String fileName = "";
		String yyyyMM = new SimpleDateFormat("yyyyMM").format(new Date());
		String filePath = request.getSession().getServletContext().getRealPath("/") + "upfiles/" + yyyyMM + "/";
		try {
			File temp = new File(filePath);
			if(!temp.exists()) {
				temp.mkdirs();
			}
			fileName = String.valueOf((int)(Math.random() * 100000000)) + ".html";
			filePath += "/" + fileName;
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "/upfiles/" + yyyyMM + "/" + fileName;
	}
}
