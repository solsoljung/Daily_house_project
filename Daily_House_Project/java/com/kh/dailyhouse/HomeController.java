package com.kh.dailyhouse;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.service.SiUserService;
 
@Controller
public class HomeController {

	// 최근후기 내용 5개 가져오기 추가

	@Inject
	private SiUserService siUserService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) throws Exception {
		
		List<HomeReviewDto> list = siUserService.getHomeReview();
		model.addAttribute("list", list);
		
		return "home";
	}
	
	
}
