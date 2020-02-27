package com.kh.dailyhouse;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dailyhouse.domain.HomeHomesDto;
import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.service.SiUserService;
 
@Controller
public class HomeController {

	@Inject
	private SiUserService siUserService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception { 
		List<HomeReviewDto> listReview = siUserService.getHomeReview();
		model.addAttribute("listReview", listReview);
		
		List<HomeHomesDto> listHome = siUserService.getHomeHomes();
		model.addAttribute("listHome", listHome);
		
		return "home";
	}
	// 게시물 5개씩 추가로 얻어오기
	@RequestMapping(value = "/more", method = RequestMethod.GET)
	@ResponseBody
	public List<HomeHomesDto> more(int moreNum1, int moreNum2, Model model) throws Exception {
		
		List<HomeHomesDto> listHome = siUserService.getMoreHomeHomes(moreNum1,moreNum2);
		model.addAttribute("listHome", listHome);
		return listHome;
	}
}
