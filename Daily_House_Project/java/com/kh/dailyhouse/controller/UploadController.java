package com.kh.dailyhouse.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dailyhouse.service.CyRoomService;
import com.kh.dailyhouse.util.FileUploadUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@Resource
	private String uploadPath; 
	
	@Inject
	private CyRoomService roomService;

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces="text/plain; charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {
		String originalFilename = file.getOriginalFilename();
		String dirPath = FileUploadUtil.uploadFile(uploadPath, originalFilename, file.getBytes());
		String path = dirPath.replace("\\", "/");
		return path;
	}
	
	@RequestMapping(value = "/displayFile", method =  RequestMethod.GET)
	@ResponseBody
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = uploadPath + File.separator + fileName.replace("/", "\\");
		System.out.println("realPath:"+ realPath);
		FileInputStream is = new FileInputStream(realPath);
		byte[] bytes = IOUtils.toByteArray(is);
		is.close();
		return bytes;
	}
	
	@RequestMapping(value = "/deleteFile", method =  RequestMethod.GET)
	@ResponseBody
	public String deleteFile(@RequestParam("fileName") String fileName) throws Exception {
		System.out.println("fileName:" + fileName);
		FileUploadUtil.delete(fileName, uploadPath); // 파일 삭제
		return "success";
	}
	
	@RequestMapping(value = "/deleteFileAndData", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFileAndData(@RequestParam("fileName") String fileName) throws Exception {
		System.out.println("fileName:" + fileName);
		
		FileUploadUtil.delete(fileName, uploadPath); // 파일 삭제
		roomService.deleteAttach(fileName); // 데이터 삭제
		return "success";
	}
	
	
	
	
}
