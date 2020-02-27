package com.kh.dailyhouse;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.HomeHomesDto;
import com.kh.dailyhouse.domain.HomeReviewDto;
import com.kh.dailyhouse.domain.MessageVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.SiUserService;
import com.kh.dailyhouse.service.SolMessageService;

import sun.print.resources.serviceui;
 
@Controller
public class HomeController {

	// 최근후기 내용 5개 가져오기 추가

	@Inject
	private SiUserService siUserService;
	
	@Inject
	private SolMessageService messageService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws Exception {
		
		List<HomeReviewDto> listReview = siUserService.getHomeReview();
		model.addAttribute("listReview", listReview);
		
		List<HomeHomesDto> listHome = siUserService.getHomeHomes();
		model.addAttribute("listHome", listHome);
		
		//여기 부턴 정솔
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo != null) {

			String user_email = userVo.getUser_email();
			System.out.println("지금로그인한 사람은 바로바로~~~!: "+user_email);
			int message_count = messageService.getReceiveMessageCount(user_email);
			System.out.println("메세지 갯수: "+ message_count);
			model.addAttribute("message_count", message_count);
		}
		
		return "home";
	}
	
}
