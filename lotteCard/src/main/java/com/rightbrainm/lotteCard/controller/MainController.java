package com.rightbrainm.lotteCard.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		String filePath = request.getSession().getServletContext().getRealPath("/") + "upfiles/";
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

		return "/upfiles/" + fileName;
	}

	@RequestMapping(value="/upfiles/{fileName}")
	public String lotteFile(HttpServletRequest request, @PathVariable("fileName") String fileName) {

		File upFile = new File(request.getSession().getServletContext().getRealPath("/") + "upfiles/" + fileName + ".html");
		String result = "";
		try {
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(upFile), "utf-8"));
			String str;
			while((str = bufferedReader.readLine()) != null) {
				result += str + "\n";
			}
			bufferedReader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		upFile.delete();
		request.setAttribute("content", result);

		return "upFile";
	}
}
