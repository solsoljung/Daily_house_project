package com.kh.dailyhouse;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.service.SiUserService;
 
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 최근후기 내용 5개 가져오기 추가

	@Inject
	private SiUserService siUserService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		try {
			List<RoomReviewVo> list = siUserService.getHomeReview();
			model.addAttribute(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	
}
