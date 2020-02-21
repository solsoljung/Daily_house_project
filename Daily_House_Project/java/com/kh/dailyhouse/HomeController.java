package com.kh.dailyhouse;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.service.SiUserService;
 
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 최근후기 내용 5개 가져오기 추가

	@Inject
	private SiUserService siUserService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<HomeReviewDto> list = siUserService.getHomeReview();
		model.addAttribute("list", list);
		
		return "home";
	}
	
	
}
