package com.krist.play;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.krist.play.dao.MainDAO;
import com.krist.play.service.CardService;
import com.krist.play.service.MemberService;
import com.krist.play.service.PlayInfoService;
import com.krist.play.service.PlayReplyService;
import com.krist.play.service.PlayTicketService;
import com.krist.play.vo.CardChargeListVO;
import com.krist.play.vo.MemberVO;
import com.krist.play.vo.Parame;
import com.krist.play.vo.PlayInfoList;
import com.krist.play.vo.PlayInfoVO;
import com.krist.play.vo.PlayReplyList;
import com.krist.play.vo.PlayReplyVO;
import com.krist.play.vo.PlayTicketList;
import com.krist.play.vo.PlayTicketVO;
import com.krist.play.vo.cardCheckParame;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request ,Locale locale, Model model) {
		HttpSession session = request.getSession();
		System.out.println("작업 디렉토리 -> " + System.getProperty("user.dir"));
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		ArrayList<PlayInfoVO> list = new ArrayList<PlayInfoVO>();
		list = playTicketService.getMainCarousel(mapper);
		PlayInfoVO playInfoVO = list.get(0) ;
		ArrayList<PlayInfoVO> modelList = new ArrayList<PlayInfoVO>();
		for (int i = 1; i < list.size();i++) {
			modelList.add(list.get(i));
		}
		model.addAttribute("playInfoActive", playInfoVO);
		model.addAttribute("modelList", modelList);
		session.setAttribute("loginCheck", 2);
		return "gate";
	}
	
	
	
	@RequestMapping("/gate")
	public String gate (HttpServletRequest request, Model model) {
		logger.info("homeController -> gate()");
		HttpSession session = request.getSession();
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		ArrayList<PlayInfoVO> list = new ArrayList<PlayInfoVO>();
		list = playTicketService.getMainCarousel(mapper);
		PlayInfoVO playInfoVO = list.get(0) ;
		ArrayList<PlayInfoVO> modelList = new ArrayList<PlayInfoVO>();
		for (int i = 1; i < list.size();i++) {
			modelList.add(list.get(i));
		}
		model.addAttribute("playInfoActive", playInfoVO);
		model.addAttribute("modelList", modelList);
		return "gate";
	}
	
	
	@RequestMapping("/signUp")
	public String signUp (HttpServletRequest request, Model model) {
		logger.info("homeController -> signUp()");
		String status = request.getParameter("status");
		String currentPage = request.getParameter("currentPage");
		
		int idxC = 0;
		try {
			idxC = Integer.parseInt( request.getParameter("idxC") );
		} catch (Exception e) {
		}
		
		model.addAttribute("status", status);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("idxC", idxC);
		
		
		return "signUp";
	}
	
	
	
	@RequestMapping("/searchIdPasswordForId")
	public String searchIdPassword() {
		logger.info("homeController -> searchIdPasswordForId()");
		
		return "searchIdPasswordForId";
	}
	
	@ResponseBody
	@RequestMapping("/searchPasswordForIdForm")
	public String searchPasswordForIdForm (HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("name", name);
		hmap.put("email", email);
		String id = memberService.searchPasswordForIdForm(mapper, hmap);
		
		return id;
	}
	
	
	
	@RequestMapping("/searchIdPasswordForPass")
	public String searchIdPasswordForPass() {
		logger.info("homeController -> searchIdPasswordForPass()");
		
		return "searchIdPasswordForPass";
	}
	
	@ResponseBody
	@RequestMapping("/searchPasswordForPassForm")
	public String searchPasswordForPassForm (@RequestBody String json) {
		ObjectMapper objectMapper = new ObjectMapper();
		
		HashMap<String, String> jsonMap = null;
		try {
			jsonMap = objectMapper.readValue(json, new TypeReference<HashMap<String, String>>() {
			});
		} catch (JsonProcessingException e) {
			System.out.println("searchPasswordForPassForm json 변환 실패");
		}
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String password = memberService.searchPasswordForPassForm(mapper, jsonMap);
		
		
		return password;
	}
	
	
	
	
	@RequestMapping("/searchIdPasswordResult")
	public String searchIdPasswordResult(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		//logger.info("homeController -> searchIdPasswordResult()");
		String result = request.getParameter("result");
		String status = request.getParameter("status");
		if (status != null || result != null) {
			if (status.equalsIgnoreCase("fid")) {
				model.addAttribute("status", "아이디 ");
			} else {
				model.addAttribute("status", "비밀번호 ");
			}
			
		} else {
			System.out.println("searchIdPasswordResult status 또는 result null 발생");
		}
		model.addAttribute("result", result);
		
		return "searchIdPasswordResult";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		logger.info("homeController -> idCheck()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		MemberService service = ctx.getBean("memberService", MemberService.class);
		String id = request.getParameter("id");
		int idCheck = service.idCheck(mapper, id);
		
		System.out.println("homtContoller -> idCheck -> id -> " + id);
		System.out.println("homtContoller -> idCheck -> idCheck ->" + idCheck);
		return idCheck + "";
	}
	
	@ResponseBody
	@RequestMapping("/mSignUp")
	public String mSignUp (HttpServletRequest request) {
		logger.info("homeController -> mSignUp()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberVO memberVO = ctx.getBean("member", MemberVO.class);
		MemberService service = ctx.getBean("memberService", MemberService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String addrPost = request.getParameter("addrPost");
		String addrMain = request.getParameter("addrMain");
		String addrDetail1 = request.getParameter("addrDetail1");
		String addrDetail2 = request.getParameter("addrDetail2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
	
		
//		System.out.println("HomeController -> mSignUp -> id ->" + id);
		memberVO.setId(id);
		memberVO.setName(name);
		memberVO.setPassword(password);
		memberVO.setAddrPost(addrPost);
		memberVO.setAddrMain(addrMain);
		memberVO.setAddrDetail1(addrDetail1);
		memberVO.setAddrDetail2(addrDetail2);
		memberVO.setEmail(email);
		memberVO.setPhone(phone);
		
		logger.info("HomeController -> mSignUp -> memberVO -> {}", memberVO);
		int checkCount = service.checkCountSignUp(mapper, memberVO);
		int result = -1;
		if (checkCount == 0) {
			result = service.signUp(mapper, memberVO);
		}
		return result + "";
	}
	
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		logger.info("homeController -> login()");
		String status = request.getParameter("status");
//		System.out.println("homeController -> login() -> status -> " + status);
		
		model.addAttribute("status", status);
		
		return "login"; 
	}
	
	@RequestMapping("/loginNotB")
	public String loginNotB(HttpServletRequest request, Model model) {
		logger.info("homeController -> loginNotB()");
		
		int idxC = 0;
		String status = request.getParameter("status");
		try {
			if (status.equalsIgnoreCase("ww")) {
				idxC = Integer.parseInt( request.getParameter("idxC") );
				model.addAttribute("idxC", idxC);
			}
		} catch (Exception y) {
		}
		
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
			
		} catch (Exception z) {
		}
//		System.out.println("homeController -> loginNotB() -> status ->" + status );
		model.addAttribute("status", status);
		model.addAttribute("currentPage", currentPage);
		
		
		return "loginNotB"; 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		logger.info("homeController -> logout()");
		HttpSession session = request.getSession();
		session.removeAttribute("loginCheck");
		session.removeAttribute("loginId");
		session.removeAttribute("loginIdxM");
		session.setAttribute("loginCheck", 2);
		return "redirect:gate";
	}
	
	
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck (@RequestBody String loginInfo, HttpServletRequest request) {
		logger.info("homeController -> loginCheck()");
//		System.out.println("homeContoller -> loginCheck() -> loginInfo -> " + loginInfo);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> idPassword = null;
		try {
			idPassword = objectMapper.readValue(loginInfo, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
//		System.out.println("homeController -> loginCheck() -> loginInfoJson() -> " + idPassword);
//		System.out.println("loginInfoJson ->  id(key) ->  " + idPassword.get("id"));
		
		AbstractApplicationContext ctx  = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		MemberVO memberVO = ctx.getBean("member", MemberVO.class);
		MemberService service = ctx.getBean("memberService", MemberService.class);
		memberVO.setId(String.valueOf( idPassword.get("id")) );
		memberVO.setPassword(String.valueOf( idPassword.get("password") ));
		
		HttpSession session = request.getSession();
		int loginCheck = service.getLoginCheck(mapper, memberVO); 
//		System.out.println("homeController -> loginCheck() -> loginCheck -> " + loginCheck);
		
		if ( loginCheck == 1 ) {
			session.setAttribute("loginCheck", 1);
			session.setAttribute("loginId", String.valueOf( idPassword.get("id") ));
			return "{ \"resCode\" : \"1\" }";  // 정상
		} else {
			return "{ \"resCode\" : \"2\" }";  // 에러
		}
		
	}
	
	@RequestMapping("/anonymous")
	public String anonymous (HttpServletRequest request, Model model) { 
		logger.info("homeController -> anonymous()");
		String status = request.getParameter("status");
		
		model.addAttribute("status", status);
		
		return "anonymousLogin";
	}
	
	@ResponseBody
	@RequestMapping("/anonymousLoginCheck")
	public String anonymousLoginCheck (@RequestBody String anonymousLoginCheck, HttpServletRequest request) {
		logger.info("homeController -> anonymousLoginCheck()");
//		System.out.println("homeContorller -> anonymousLoginCheck() -> loginCheck -> " + anonymousLoginCheck);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> jsonLoginCheck = null;
		try {
			jsonLoginCheck = objectMapper.readValue(anonymousLoginCheck, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
//		System.out.println("homeContorller -> anonymousLoginCheck() -> jsonLoginCheck(key;id) -> " + jsonLoginCheck.get("bookNumber"));
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketVO playTicketVO = ctx.getBean("playTicket", PlayTicketVO.class);
		playTicketVO.setBookNumber(String.valueOf( jsonLoginCheck.get("bookNumber") ));
		playTicketVO.setEmail(String.valueOf( jsonLoginCheck.get("email") ));
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		int anonymousUserLoginCheckCount = mapper.getAnonymousUserInfo(playTicketVO);
//		anonymousUserLoginCheckCount가 1이상이면 예약건이 있으므로 로그인
//		System.out.println("homeController -> anonymousLoginCheck() -> anonymousUserLoginCheckCount -> " + anonymousUserLoginCheckCount);
		
		
		return anonymousUserLoginCheckCount + "";
	}
	
	@RequestMapping("/twoWay")
	public String twoWay(HttpServletRequest request, Model model) {
		logger.info("homeController -> twoWay()");
		
		return "twoWay";
	}
	
	
	@ResponseBody
	@RequestMapping("/anonymousBooking")
	public String anonymousBooking (HttpServletRequest request) {
		logger.info("homeController -> anonymousBooking()");
		HttpSession session = request.getSession();
		session.setAttribute("loginCheck", 3);
		session.setAttribute("loginId", "anonymous");
		return "3";
	}
	
	
	
	@RequestMapping("/booking")
	public String booking(HttpServletRequest request, Model model) {
		logger.info("homeController -> booking()");
			
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
		} catch (Exception e) {
		}
		
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoList playInfoList = ctx.getBean("playInfoList", PlayInfoList.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		playInfoList = service.getPlayAllList(currentPage, mapper);
		System.out.println("homecontroller -> booking() -> playInfoList -> " + playInfoList.toString());
		model.addAttribute("playInfoList", playInfoList);
		model.addAttribute("currentPage", currentPage);
		
		
		return "booking";
		
	}
	
	@RequestMapping("/booking2")
	public String booking2(HttpServletRequest request, Model model) {
		logger.info("homeController -> booking2()");
			int idxP = 0;
		try {
			idxP = Integer.parseInt( request.getParameter("idxP") );
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		session.setAttribute("idxP", idxP);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		playInfoVO = service.getPlayInfo(mapper, idxP);
				
//		
		System.out.println("homecontroller -> booking2 -> " + idxP);
		System.out.println("homecontroller -> booking2 -> " + playInfoVO.toString());
		
		Date startDate = playInfoVO.getPlayStartDate();
		Date endDate = playInfoVO.getPlayEndDate();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		
//		System.out.println(sdf.format(startDate));
//		System.out.println(sdf.format(endDate));
		String[] splitPlayTime =  playInfoVO.getPlayTime().split(" ");
		
		ArrayList<String> playTime = new ArrayList<String>();
		for (String time : splitPlayTime) {
			playTime.add(time);
		}
		
		String[] viewDate = playInfoVO.getPlayDay().split(" ");
		ArrayList<String> playDay = new ArrayList<String>();
		for (String date : viewDate) {
			playDay.add(date);
		}
		
		
		
		model.addAttribute("playDay", playDay);
		model.addAttribute("playTime", playTime);
		model.addAttribute("startDate", sdf.format(startDate));
		model.addAttribute("endDate", sdf.format(endDate));
		model.addAttribute("playInfo", playInfoVO);
		model.addAttribute("playFee", playInfoVO.getPlayFee());
		return "booking2";
	}
	
	@RequestMapping("/booking3")
	public String booking3(HttpServletRequest request, Model model) {
		logger.info("homeController -> booking3()");
		
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		String viewPlace = request.getParameter("viewPlace");
		String viewDate = request.getParameter("viewDate");
		String viewTime = request.getParameter("viewTime");
		
//		System.out.println("booking3() playPlace ->  " + playPlace);
//		System.out.println("booking3() playDay -> " + playDay);
//		System.out.println("booking3() playTime -> " + playTime);
//		System.out.println("booking3() idxP -> " + idxP);
		
		model.addAttribute("idxP", idxP);
		model.addAttribute("viewTime", viewTime);
		model.addAttribute("viewDate", viewDate);
		model.addAttribute("viewPlace", viewPlace);
		
		
		
		return "booking3";
	}
	
	@RequestMapping("/booking4")
	public String booking4(HttpServletRequest request, Model model, PlayTicketVO playTicketVO) {
		logger.info("homeController -> booking4()");
		
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		String viewPlace = request.getParameter("viewPlace");
		String viewDate = request.getParameter("viewDate");
		String viewTime = request.getParameter("viewTime");
		String seatNumber = request.getParameter("seatNumber");
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml")	;
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		playInfoVO = service.getPlayInfo(mapper, idxP);
		
//		System.out.println("booking4() playTicketVO -> " + playTicketVO);
//		System.out.println("booking4() playPlace ->  " + viewPlace);
//		System.out.println("booking4() viewDate -> " + viewDate);
//		System.out.println("booking4() viewTime -> " + viewTime);
//		System.out.println("booking4() idxP -> " + idxP);
//		System.out.println("booking4() seatNumber -> " + seatNumber);
//		System.out.println("booking4() loginCheck -> " + loginCheck);
//		System.out.println("booking4() playInfoVO -> " + playInfoVO);
		
		model.addAttribute("idxP", idxP);
		model.addAttribute("viewTime", viewTime);
		model.addAttribute("viewDate", viewDate);
		model.addAttribute("viewPlace", viewPlace);
		model.addAttribute("seatNumber", seatNumber);
		model.addAttribute("playFee", playInfoVO.getPlayFee());
		return "booking4";
	}
	
	@RequestMapping("/booking5")
	public String booking5(HttpServletRequest request, Model model, PlayTicketVO playTicketVO, MemberVO memberVO) {
		logger.info("homeController -> booking5()");
		
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		String viewPlace = request.getParameter("viewPlace");
		String viewDate = request.getParameter("viewDate");
		String viewTime = request.getParameter("viewTime");
		String seatNumber = request.getParameter("seatNumber");
		String viewer = request.getParameter("viewer");//
		int viewerCount = Integer.parseInt( request.getParameter("viewerCount") );
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addrMain = request.getParameter("addrMain");
		String addrDetail1 = request.getParameter("addrDetail1");
		String addrDetail2 = request.getParameter("addrDetail2");
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		playInfoVO = service.getPlayInfo(mapper, idxP);
		
//		System.out.println("booking5() playPlace ->  " + playPlace);
//		System.out.println("booking5() playDay -> " + playDay);
//		System.out.println("booking5() playTime -> " + playTime);
//		System.out.println("booking5() idxP -> " + idxP);
//		System.out.println("booking5() seatNumber -> " + seatNumber);
//		System.out.println("booking5() playTicketVO 커맨드객체 -> " + playTicketVO.toString());
		System.out.println("booking5() playTicketVO memberVO -> " + memberVO);
		
		model.addAttribute("idxP", idxP);
		model.addAttribute("playInfo", playInfoVO);
		model.addAttribute("viewTime", viewTime);
		model.addAttribute("viewDate", viewDate);
		model.addAttribute("viewPlace", viewPlace);
		model.addAttribute("seatNumber", seatNumber);
		model.addAttribute("addrMain", addrMain);
		model.addAttribute("addrDetail1", addrDetail1);
		model.addAttribute("addrDetail2", addrDetail2);
		model.addAttribute("viewer", viewer);
		model.addAttribute("viewerCount", viewerCount);
		model.addAttribute("phone", phone);
		model.addAttribute("email", email);
		
		return "booking5";
	}
	
	
	@RequestMapping("/payment")
	public String payment (HttpServletRequest request, Model model) {
//		logger.info("homeController -> payment()");
		
		HttpSession session = request.getSession();
		try {
			String blockReload = (String) session.getAttribute("blockReload");
			if (blockReload == null) {
				throw new IOException();
			} else {
				System.out.println("blockReplad 값 남아있다 ");
				session.removeAttribute("blockReload");
			}
		} catch (IOException e) {
		}
		
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		String viewPlace = request.getParameter("viewPlace");
		String viewDate = request.getParameter("viewDate");
		String viewTime = request.getParameter("viewTime");
		String seatNumber = request.getParameter("seatNumber");
		String viewer = request.getParameter("viewer");//
		int viewerCount = Integer.parseInt( request.getParameter("viewerCount") );
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addrMain = request.getParameter("addrMain");
		String addrDetail1 = request.getParameter("addrDetail1");
		String addrDetail2 = request.getParameter("addrDetail2");
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		playInfoVO = service.getPlayInfo(mapper, idxP);
		
		
		model.addAttribute("idxP", idxP);
		model.addAttribute("viewTime", viewTime);
		model.addAttribute("viewDate", viewDate);
		model.addAttribute("viewPlace", viewPlace);
		model.addAttribute("seatNumber", seatNumber);
		model.addAttribute("addrMain", addrMain);
		model.addAttribute("addrDetail1", addrDetail1);
		model.addAttribute("addrDetail2", addrDetail2);
		model.addAttribute("viewer", viewer);
		model.addAttribute("viewerCount", viewerCount);
		model.addAttribute("phone", phone);
		model.addAttribute("email", email);
		model.addAttribute("playFee", playInfoVO.getPlayFee());
		model.addAttribute("amount", (viewerCount * playInfoVO.getPlayFee()) );
		model.addAttribute("poster", playInfoVO.getPlayPoster());
		model.addAttribute("playTitle", playInfoVO.getPlayTitle());
		
		return "payment";
	}
	
	@RequestMapping("/paymentResult")
	public String paymentResult (HttpServletRequest request, Model model, PlayTicketVO playTicketVO) {
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		int idxCard = Integer.parseInt( request.getParameter("idxCard") );
		int loginCheck = Integer.parseInt( request.getParameter("loginCheck") );
		String ownerName = request.getParameter("owner");
		String poster = request.getParameter("poster");
		String playTitle = request.getParameter("playTitle");
		int playFee = Integer.parseInt(request.getParameter("playFee"));
		
		
		model.addAttribute("idxP", idxP);
		model.addAttribute("idxCard", idxCard);
		model.addAttribute("loginCheck", loginCheck);
		model.addAttribute("owner", ownerName);
		model.addAttribute("poster", poster);
		model.addAttribute("playTitle",playTitle);
		model.addAttribute("playFee", playFee);
		model.addAttribute("ticketVO", playTicketVO);
		
		
		
		return "paymentResult";
	}
	

	
	@RequestMapping("/booking6") 
	public String booking6 (HttpServletRequest request, Model model, PlayTicketVO playTicketVO) {
//		logger.info("homeController -> booking6()");
		HttpSession session = request.getSession();
		try {
			String blockReload = (String) session.getAttribute("blockReload");
			if (blockReload == null) {
				System.out.println("어라랍스터 널이네???");
				throw new IOException("어라랍스터 널이네???");
			} else {
				return "errorPage";
			}
		} catch (IOException x) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		int idxCard = Integer.parseInt( request.getParameter("idxCard") );
		int loginCheck = Integer.parseInt( request.getParameter("loginCheck") );
		String chargeKey = request.getParameter("chargeKey");
		String ownerName = request.getParameter("owner");
		
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		String bookNumber = ""; 
		for (int i = 0; i < 7; i++) {
			bookNumber += random.nextInt(9);
		}
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		PlayTicketService service = ctx.getBean("playTicketService", PlayTicketService.class);
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		CardService cardService = ctx.getBean("cardService", CardService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		MemberVO memberVO = ctx.getBean("member", MemberVO.class);
		
		playInfoVO = playInfoService.getPlayInfo(mapper, idxP);

		String id = playTicketVO.getId();
		if (id.equals("anonymous")) { 
//				비회원 로그인일때
			 int res = memberService.saveMember(mapper, playTicketVO);
			 if (res == 1) {
				 memberVO = memberService.getMemberInfo(mapper, playTicketVO);
				 playTicketVO.setMemberConnect(memberVO.getIdxM());
				 System.out.println("homeController -> booking6() -> memberVO ->" + memberVO);
			 } else {
				 
			 }
		} else {
//				회원 로그인때
			System.out.println("homeController -> booking6() -> playTicketVO ->" + playTicketVO);
			memberVO = memberService.getMemberInfoId(mapper, playTicketVO.getId());
			System.out.println("homeController -> booking6() -> memberVO ->" + memberVO);
			playTicketVO.setMemberConnect(memberVO.getIdxM());
		}
		
		System.out.println("homeController -> booking6() -> playInfoVO ->" + playInfoVO);
		
		
//			System.out.println("homeController -> booking6() -> playTicketVO ->" + playTicketVO);
		playTicketVO.setBookNumber(bookNumber);
		playTicketVO.setPlayInfoConnect(idxP);
		playTicketVO.setPlayTitle(playInfoVO.getPlayTitle());
		playTicketVO.setPlayStartDate(playInfoVO.getPlayStartDate());
		playTicketVO.setPlayEndDate(playInfoVO.getPlayEndDate());
		playTicketVO.setAmount(playInfoVO.getPlayFee() * playTicketVO.getViewerCount());
		playTicketVO.setPlayPoster(playInfoVO.getPlayPoster());
		playTicketVO.setChargeKey(chargeKey);
		
		System.out.println("homeController -> booking6() -> playTicketVO ->" + playTicketVO);
		int result = service.saveTicket(mapper, playTicketVO);
		CardChargeListVO cardChargeListVO = new CardChargeListVO();
		cardChargeListVO.setCardConnect(idxCard);
		cardChargeListVO.setChargeKey(chargeKey);
		cardChargeListVO.setAmount(playInfoVO.getPlayFee() * playTicketVO.getViewerCount());
		cardChargeListVO.setName(ownerName);
		cardChargeListVO.setChargePlace("Bookers");
		
		
		if (result == 1) {
			service.upOrderCount(mapper, idxP);
			int cardSaveResult = cardService.insertChargeList(mapper, cardChargeListVO);
		}
		
		
		if (loginCheck == 3) {
			session.setAttribute("loginCheck", 2);
		}
		
		
		model.addAttribute("playTicketVO", playTicketVO);
		model.addAttribute("playInfo", playInfoVO);
		
		session.setAttribute("blockReload", "block");	
		
		
			return "booking6";
		}
				
		
	}
	
	
	
	@RequestMapping("/bookingCheckList")
	public String bookingCheckList(HttpServletRequest request, Model model) {
		logger.info("homeController -> bookingCheckList()");
		HttpSession session = request.getSession();
		int sessValue = (int) session.getAttribute("loginCheck");
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberVO memberVO = ctx.getBean("member", MemberVO.class);
		PlayTicketVO playTicketVO = ctx.getBean("playTicket", PlayTicketVO.class);
		PlayTicketList playTicketList = ctx.getBean("playTicketList", PlayTicketList.class);
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class  );
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
		} catch (Exception e) {
		}
		
		if (sessValue == 1 ) { //로그인 O
			String id = (String) session.getAttribute("loginId");
			memberVO = memberService.getMemberInfoId(mapper, id);
			int idxM = memberVO.getIdxM();
			playTicketList = playTicketService.getOrderedTicket(mapper, idxM, currentPage);
//			System.out.println("homeController -> bookingCheckList() -> playTicketList -> " + playTicketList);

			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("name", memberVO.getName());
			model.addAttribute("profileImage", memberVO.getImage());
			model.addAttribute("idxM", idxM);
			model.addAttribute("viewer", memberVO.getName());
			model.addAttribute("playTicket", playTicketList);
			
		} else {
			String bookNumber = request.getParameter("bookNumber");
			playTicketVO = playTicketService.getMemberInfo_bookCheckList(mapper, bookNumber);
			String email = request.getParameter("email");
			playTicketList = playTicketService.getOrderedTicketunLogin(mapper, bookNumber, currentPage);

			model.addAttribute("profileImage", "default/default.jpg");
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("idxM", playTicketVO.getMemberConnect());
			model.addAttribute("viewer", playTicketVO.getViewer());
			model.addAttribute("playTicket", playTicketList);
		}
		
		return "bookingCheckList";
		
	}
	
	
	
	
	
	@RequestMapping("/modifyInfo") 
	public String modifyInfo(HttpServletRequest request, Model model) {
//		logger.info("homeController -> modifyInfo()");
		int idxM = Integer.parseInt( request.getParameter("idxM") );
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		MemberVO memberVO = memberService.getMemberProfile(mapper, idxM);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("idxM", idxM);
		return "modifyInfo";
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/defaultFormValue_modifyInfo")
	public String defaultFormValue_modifyInfo (@RequestBody String json) {
//		logger.info("homeController -> defaultFormValue_modifyInfo()");
//		System.out.println("HomeController -> defaultFormValue_modifyInfo() -> json -> " + json);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> transform = null;
		try {
			transform = objectMapper.readValue(json, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
//		System.out.println("HomeController -> defaultFormValue_modifyInfo() -> transform;idxM -> " + transform.get("idxM"));
		int idxM =  Integer.parseInt( (String) transform.get("idxM") );
//		System.out.println("HomeController -> defaultFormValue_modifyInfo() -> transform;idxM -> " + idxM);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberService service = ctx.getBean("memberService", MemberService.class);
		MemberVO memberVO = service.getMemberInfo_modifyInfo(mapper, idxM);
//		System.out.println("HomeController -> defaultFormValue_modifyInfo() -> memberVO -> " + memberVO);

		String id = "";
		String password = "";
		String addrPost = "";
		String addrMain = "";
		String addrDetail1 = "";
		String addrDetail2 = "";
		String email = "";
		String phone = "";
		String name = "";
		
		try {
			id = URLEncoder.encode( memberVO.getId(), "utf-8");
			password = URLEncoder.encode( memberVO.getPassword(), "utf-8");
			addrPost = URLEncoder.encode( memberVO.getAddrPost(), "utf-8");
			addrMain = URLEncoder.encode( memberVO.getAddrMain(), "utf-8");
			addrDetail1 = URLEncoder.encode( memberVO.getAddrDetail1(), "utf-8");
			addrDetail2 = URLEncoder.encode( memberVO.getAddrDetail2(), "utf-8");
			email = URLEncoder.encode( memberVO.getEmail(), "utf-8");
			phone = URLEncoder.encode( memberVO.getPhone(), "utf-8");
			name = URLEncoder.encode( memberVO.getName(), "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		 
		
		String fetchResult = String.format( " { \"id\" : \"%s\","
				+ " \"password\" : \"%s\","
				+ " \"addrPost\" : \"%s\","
				+ " \"addrMain\" : \"%s\","
				+ " \"addrDetail1\" : \"%s\","
				+ " \"addrDetail2\" : \"%s\","
				+ " \"email\" : \"%s\","
				+ " \"name\" : \"%s\","
				+ " \"phone\" : \"%s\" }", id, password, addrPost, addrMain, addrDetail1, addrDetail2, email, name , phone);
		System.out.println("HomeController -> defaultFormValue_modifyInfo() -> fetchResult -> " + fetchResult);
		return fetchResult;
	}
	
	
	
	
	
	
	@RequestMapping("/modifyInfoBridge")
	public String modifyInfoBridge (MultipartHttpServletRequest request, MemberVO memberVO) {
//		logger.info("homeController -> modifyInfoBridge()");
//		System.out.println("HomeController -> modifyInfoBridge() -> memberVO -> " + memberVO);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String id = memberVO.getId();
		File storage = new File( "playStorage" + File.separator + id);
		System.out.println("저장 경로 -> " + storage.getAbsolutePath());
		
		if (!storage.exists()) {
			storage.mkdirs();
		}
		
		Iterator<String> iterator = request.getFileNames();
		String ext = "";
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
//			System.out.println("uploadFileName -> " + uploadFileName);
			MultipartFile multipartFile = request.getFile(uploadFileName);
			String originFileName = multipartFile.getOriginalFilename();
//			System.out.println("originFileName -> " + originFileName);
			ext = originFileName.substring(originFileName.lastIndexOf("."));
//			System.out.println("ext -> " + ext);
			
			
			if (originFileName != null && originFileName.trim().length() != 0 ) {
				try {
					multipartFile.transferTo(new File(storage + File.separator + "profile" + ext));
				} catch (IllegalStateException | IOException e) {
					System.out.println("파일 전송 오류 및 실패");
				}
			}
		}
		
		String saveAddr = storage + File.separator + "profile" + ext;
		System.out.println("HomeController -> modifyInfoBridge() -> 파일 저장 주소 -> " + saveAddr);
		memberVO.setImage(id + File.separator + "profile" + ext);
		
		int result = memberService.modifyMemberInfo(mapper, memberVO);
//		System.out.println("HomeController -> modifyInfoBridge() -> result -> " + result);
		
		return "redirect:bookingCheckList";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/signOut")
	public String signOut (@RequestBody String jsonInfo, HttpServletRequest request) {
//		System.out.println("HomeController -> signOut() -> jsonInfo -> "+ jsonInfo);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> jsonMap = null;
		try {
			jsonMap = objectMapper.readValue(jsonInfo, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		MemberService service = ctx.getBean("memberService", MemberService.class);
		HttpSession session = request.getSession();
		int loginCheck = 2;
		int result = 0;
		try {
			result = service.signOut(mapper, jsonMap);
			loginCheck = Integer.parseInt( (String) session.getAttribute("loginCheck") );
			if (result == 1) {
				if (loginCheck == 1) {
					session.setAttribute("loginCheck", 2);
				}
			}
		} catch (Exception e) {
		}
			
		
		return result + "";
	}
	
	
	
	
	
	@RequestMapping("/playList")
	public String playList(HttpServletRequest request, Model model) {
//		logger.info("homeController -> playList()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
//		예매율 1위 playinfoVO 
		PlayInfoVO playInfoVO = playInfoService.getPlayInfo_playList(mapper);
		System.out.println("HomeController -> playLIst() -> playInfoVO -> " + playInfoVO);
		model.addAttribute("playInfoVO", playInfoVO);
		
//		Desc 내림차순 정렬의 playinfoList
		int currentPage = 1;
		PlayInfoList playInfoList = playInfoService.getPlayList(mapper, currentPage);
		model.addAttribute("playInfoList", playInfoList);
		model.addAttribute("currentPage", currentPage);
		
		
		return "playList";
	}
	
	
	
	
	
	@RequestMapping("/playInfo") 
	public String playInfo (HttpServletRequest request, Model model) {
//		logger.info("homeController -> playInfo()");
		int idxP = 0;
		int currentPage = 1;
		try {
			idxP = Integer.parseInt( request.getParameter("idxP") );
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
		} catch (Exception e) {
		}
//		System.out.println("homecontroller -> playInfo -> idxP  -> " + idxP);
//		System.out.println("homecontroller -> playInfo -> currentPage  -> " + currentPage);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoService service = ctx.getBean("playInfoService", PlayInfoService.class);
		PlayInfoVO playInfoVO = service.getplayinfo_playInfo(mapper, idxP);
		
		model.addAttribute("playInfoVO", playInfoVO);
		
		return "playInfo";
	}
	

	
	
	
	@RequestMapping("/playInfoDetail")
	public String playInfoDetail (HttpServletRequest request, Model model) {
//		logger.info("homeController -> playInfoDetail()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayInfoService  service = ctx.getBean("playInfoService", PlayInfoService.class);
		int idxP = Integer.parseInt( request.getParameter("idxP") );
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayInfoVO playInfoVO = service.getPlayInfo_playInfoDetail(mapper, idxP);
		
		System.out.println("HomeController -> playLIst() -> playInfoVO -> " + playInfoVO);
		ArrayList<String> playInfoDetail = new ArrayList<String>();
		if (playInfoVO.getPlayDetail().indexOf(" ") != -1) {
			String[] detail = playInfoVO.getPlayDetail().split(" ");
			for (String d : detail) {
				playInfoDetail.add(d);
			}
		} else {
			playInfoDetail.add(playInfoVO.getPlayDetail());
		}
		model.addAttribute("playInfoVO", playInfoDetail);
		
		return "playInfoDetail";
	}
	
	
	
	
	
	@RequestMapping("/AfterViewReplyList")
	public String AfterViewReply (HttpServletRequest request, Model model) {
		logger.info("homeController -> AfterViewReplyList()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyService service = ctx.getBean("playReplyService", PlayReplyService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") ); 
		} catch (Exception e) {
		}
		
		
//		초기 공연 후기 리스트
		PlayReplyList playReplyList = service.getReplyList(mapper, currentPage);		
		
		model.addAttribute("playReplyList", playReplyList);
		model.addAttribute("currentPage", currentPage);
//		System.out.println("Homecontroller -> afterViewReplyList() -> playReplyList -> " + playReplyList);
		return "AfterViewReplyList";
	}
	
	
	
	@RequestMapping("/AfterViewCommentSearch")
	public String afterViewCommentSearch (HttpServletRequest request, Model model) {
		logger.info("homeController -> AfterViewCommentSearch()");
		
		String categoryBefore = "";
		String keyword = "";
		try {
			categoryBefore = request.getParameter("category");
			if (categoryBefore.equalsIgnoreCase("subject")) {
				categoryBefore = "#";
			} else if (categoryBefore.equalsIgnoreCase("viewer")) {
				categoryBefore = "# Viewer";
			}
			keyword =  request.getParameter("keyword");
			
		} catch (Exception e) {
		}
		
		System.out.println("homeController -> afterViewCommentSearch -> category -> " + categoryBefore);
		System.out.println("homeController -> afterViewCommentSearch -> keyword -> " + keyword);
		
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") ); 
		} catch (Exception e) {
		}
//		System.out.println("# viewer  -> " + category.equalsIgnoreCase("# Viewer"));
//		System.out.println("#  -> " + categoryBefore.equalsIgnoreCase("#"));
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		PlayReplyList playReplyList = null;
		String category = "";
		if (categoryBefore != null && keyword != null) {
//			제목 검색
			if ( categoryBefore.equalsIgnoreCase("#")) {
				category = "subject";
				playReplyList = playReplyService.getSearchListForSubject(mapper, keyword, currentPage);
				
//			viewer 검색
			} else if (categoryBefore.equalsIgnoreCase("# Viewer")) {
				category = "viewer";
				playReplyList = playReplyService.getSearchListForViewer(mapper, keyword, currentPage);
				
			}
		} else {
			System.out.println("카테고리 검색 오류");
		}
		
		model.addAttribute("playReplyList", playReplyList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		
		return "AfterViewReplyList";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/AfterViewReplyWrite")
	public String AfterViewReplyWrite (HttpServletRequest request, Model model) {
		logger.info("homeController -> AfterViewReplyWrite()");
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
//		System.out.println("loginId -> " + loginId);
		
//		관람했던 공연 리스트 제목
		ArrayList<PlayTicketVO> viewedList = new ArrayList<PlayTicketVO>();
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService service = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		viewedList = service.getViewedTitle_AfterViewReplyWrite(mapper, loginId);
		
		model.addAttribute("viewedList", viewedList);
		model.addAttribute("loginId", loginId);
		model.addAttribute("currentPage", currentPage);
		
		
		return "AfterViewReplyWrite";
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/canYouSawPlay")
	public String canYouSawPlay(HttpServletRequest request) {
		logger.info("homeController -> canYouSawPlay()");
		String id = request.getParameter("id");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyService service = ctx.getBean("playReplyService", PlayReplyService.class);
		int result = service.canYouSawPlay(mapper, id);
		System.out.println("homeController -> canYouSawPlay() -> id -> " + id);
		System.out.println("homeController -> canYouSawPlay() -> result -> " + result);
		return result + "";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value =  "/getTitle", produces = "application/text; charset=utf8")
	public String getTitle (HttpServletRequest request) {
		int idxT = Integer.parseInt( request.getParameter("idxT"));
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String playTitle = playTicketService.getTitle(mapper, idxT);
		System.out.println("어라랍스터 -> " + playTitle);
		return playTitle;
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/saveReply")
	public String saveReply(MultipartFile[] file ,MultipartHttpServletRequest request) {
		
//		System.out.println("homeController -> saveReply -> formdata -> " + request.getParameter("playStar"));
//		System.out.println("homeController -> saveReply -> formdata -> " + request.getParameter("playTitle"));
//		System.out.println("homeController -> saveReply -> formdata -> " + request.getParameter("contentReply"));
//		System.out.println("homeController -> saveReply -> formdata -> " + request.getParameter("subjectReply"));
		int playStar = Integer.parseInt( request.getParameter("playStar") );
		String playTitle = request.getParameter("playTitle");
		String subjectReply = request.getParameter("subjectReply");
		String contentReply = request.getParameter("contentReply");
		String id = request.getParameter("loginId");
		int idxT = Integer.parseInt( request.getParameter("idxT"));
		
		Date date = new Date();
		System.out.println("date -> " + date);
		UUID uuid = UUID.randomUUID();
		String uuidSplit = uuid.toString().split("-")[1];
		
		int year = date.getYear() + 1900;
		int month = date.getMonth() + 1;
		int date1 = date.getDate();
		String saveName = year + "-" + month + "-" + date1 + "-" + uuidSplit;
		
//		파일 저장
		File storage = new File( "playStorage" + File.separator +
													id + File.separator +
													"reply" + File.separator + saveName );
		System.out.println("저장 경로 -> " + storage.getAbsolutePath());
		if (!storage.exists() ) {
			storage.mkdirs();
		}
		
		int result = 0;
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		String ext = playReplyService.saveFile(file, storage);
		
		
			
			try {
				
				MainDAO mapper = sqlSession.getMapper(MainDAO.class);
				PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
				MemberService memberService = ctx.getBean("memberService", MemberService.class);
				PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
				PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
				PlayReplyVO playReplyVO = ctx.getBean("playReply", PlayReplyVO.class);
				MemberVO memberVO = memberService.getMemberInfoId(mapper, id); //idxM
				Parame parame = new Parame();
				parame.setIdxM(memberVO.getIdxM());
				parame.setPlayTitle(playTitle);
				int idxP = playInfoService.getPlayInfo_saveReply(mapper, parame);
				System.out.println("idxP -> " + idxP);
				
				playReplyVO.setViewer(id);
				playReplyVO.setSubjectReply(subjectReply);
				playReplyVO.setContentReply(contentReply);
				playReplyVO.setPlayStar(playStar);
				playReplyVO.setPlayInfoConnect(idxP);
				playReplyVO.setMemberConnect(memberVO.getIdxM());
				playReplyVO.setImageReply(id + File.separator + "reply" 
													+ File.separator + saveName 
													+ File.separator + "replyImage" + ext );
				System.out.println("homeController -> saveReply() -> " + playReplyVO);
				
				result = playReplyService.saveReply(mapper, playReplyVO);
				
				if (result == 1) {
					int afterViewerCount = playTicketService.getAfterViewerCount(mapper, idxP);
					if (afterViewerCount > 0) {
						int totalStar = playTicketService.getTotalStar(mapper, idxP);
						float divided = (float) totalStar / afterViewerCount;
						String starStr = String.format("%.1f", divided);
						float star = Float.parseFloat(starStr);
						if (star != 0) {
							playInfoVO.setIdxP(idxP);
							playInfoVO.setPlayStar(star);
							int res = playInfoService.updateStar(mapper, playInfoVO);
							if (res == 1) {
								int conclusion = playTicketService.turnStarTrigger(mapper, idxT);
								System.out.println("starTrigger 변경 현황 => " + conclusion);
							} else {
							}
							System.out.println("사람들의 별점의 합계 -> " + totalStar);
							System.out.println("회원가입을 했고 공연을 본 사람들 -> " + afterViewerCount);
							System.out.println("별점의 평균점 -> " + star);
						} else {
							System.out.println("별점계산 오류!!!!");
						}
					}
					
					
				} else {
					throw new IllegalStateException();
				}
				
			} catch (IllegalStateException e) {
				System.out.println("saveReply 예외발생");
				result = 0;
			}
			
		
		
		System.out.println("homeController -> saveReply -> result -> " + result);
		
		
		
		return result + "";
		
		
	}
	
	
	@RequestMapping("/upReplyViewCount")
	public String upReplyViewCount (HttpServletRequest request, Model model) {
		logger.info("homeController -> upReplyViewCount()");
		
		int idxC = Integer.parseInt(request.getParameter("idxC"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int result = playReplyService.upReplyViewCount(mapper, idxC);
		
		model.addAttribute("idxC", idxC);
		model.addAttribute("currentPage", currentPage);
		
		
		return "redirect:AfterViewReplyRead";
	}
	
	
	
	@RequestMapping("/AfterViewReplyRead")
	public String AfterViewReplyRead(HttpServletRequest request, Model model) {
		logger.info("homeController -> AfterViewReplyRead()");
		
		int idxC = Integer.parseInt( request.getParameter("idxC") );
		int currentPage = Integer.parseInt( request.getParameter("currentPage"));
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		PlayReplyVO playReplyVO = playReplyService.getReplyInfo(mapper, idxC);
		int idxM = playReplyVO.getMemberConnect();
		int idxP = playReplyVO.getPlayInfoConnect();
		MemberVO memberVO = memberService.getMemberInfo_AfterVieewReplyRead(mapper, idxM );
		PlayInfoVO playInfoVO = playInfoService.getPlayInfo_AfterViewReplyRead(mapper, idxP);
		
		System.out.println("homeController -> AfterViewReplyRead() -> memberVO -> " + memberVO);
		System.out.println("homeController -> AfterViewReplyRead() -> playReplyVO -> " + playReplyVO);
		
		
		
		model.addAttribute("playInfoVO", playInfoVO);
		model.addAttribute("playReplyVO", playReplyVO);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("memberVO", memberVO);
		
		return "AfterViewReplyRead";
	}
	
	@RequestMapping("/modifyWritedReplyForm")
	public String modifyWritedReply (HttpServletRequest request, Model model) {
		logger.info("homeController -> modifyWritedReplyForm()");
		int idxC = Integer.parseInt( request.getParameter("idxC"));
		int currentPage = Integer.parseInt( request.getParameter("currentPage"));
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		PlayInfoService playInfoService  = ctx.getBean("playInfoService", PlayInfoService.class);
		MemberService memberService = ctx.getBean("memberService", MemberService.class);
		PlayReplyVO playReplyVO = playReplyService.getReplyInfoForModify(mapper, idxC);
		int idxM = playReplyVO.getMemberConnect();
		MemberVO memberVO = memberService.getMemberInfo_modifyReplyform(mapper, idxM);
	
		int idxP = playReplyVO.getPlayInfoConnect();
		PlayInfoVO playInfoVO = playInfoService.getPlayInfo_AfterViewReplyRead(mapper, idxP);
		
		
		model.addAttribute("playInfoVO", playInfoVO);
		model.addAttribute("playReplyVO", playReplyVO);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("currentPage", currentPage);
		
		
		return "modifyWritedReplyForm";
	}
	
	
	@ResponseBody
	@RequestMapping("/modifyAfterViewReply")
	public String modifyAfterViewReply (MultipartFile[] image, MultipartHttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		int idxC = Integer.parseInt( request.getParameter("idxC"));
		String updateSubjectReply = request.getParameter("subjectReply");
		String updateContentReply = request.getParameter("contentReply");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyService playReplyService = ctx.getBean("playReplyService", PlayReplyService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayReplyVO playReplyVO = playReplyService.getReplyInfoForUpdate(mapper, idxC);
		
		int notFile = Integer.parseInt( request.getParameter("notFile"));
		int result= 0;
		if (notFile == 1) {
			PlayReplyVO returnPlayReplyVO = playReplyService.updateSaveFile(image, playReplyVO, id);
			playReplyVO = returnPlayReplyVO;
			System.out.println("어라랍스터 " + playReplyVO);
			playReplyVO.setContentReply(updateContentReply);
			playReplyVO.setSubjectReply(updateSubjectReply);
		} else {
			playReplyVO.setSubjectReply(updateSubjectReply);
			playReplyVO.setContentReply(updateContentReply);
			playReplyVO.setImageReply(playReplyVO.getImageReply() );
			
		}
			result = playReplyService.updateAfterViewReply(mapper, playReplyVO);
			System.out.println("어라랍스터 -> " + result);
		
		return  result + "";
	}
	
	
	
	
	@RequestMapping("/ticketInfo")
	public String ticketInfo (HttpServletRequest request, Model model) {
//		logger.info("homeController -> ticketInfo()");
		int idxT = 0;
		int currentPage = 1;
		try {
			idxT = Integer.parseInt( request.getParameter("idxT") );
			currentPage = Integer.parseInt( request.getParameter("currentPage") );
			
		} catch (Exception e) {
		}
//		System.out.println("homeController -> ticketInfo() -> idxT -> " + idxT);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayTicketVO playTicketVO = playTicketService.getOrderedTicketInfo_ticketInfo(mapper, idxT);		
		
		
		
		model.addAttribute("playTicketVO", playTicketVO);
		model.addAttribute("currentPage", currentPage);
		
		return "ticketInfo";
	}
	
	@RequestMapping("/modifyPlayTicketInfo")
	public String modifyPlayTicketInfo(HttpServletRequest request, Model model) {
		logger.info("homeController -> modifyPlayTicketInfo()");
		int idxT = Integer.parseInt( request.getParameter("idxT") );
		int currentPage = Integer.parseInt( request.getParameter("currentPage"));
//		System.out.println("homeController -> modifyPlayTicketInfo() -> currentPage -> " + currentPage);
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService service = ctx.getBean("playTicketService", PlayTicketService.class);
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		
		
		PlayTicketVO playTicketVO = service.getOrderedTicketInfo(mapper, idxT);
		
		int idxP = playTicketVO.getPlayInfoConnect();
		PlayInfoVO playInfoVO = playInfoService.getPlayInfoForModify(mapper, idxP);
		
		String[] playTime = playInfoVO.getPlayTime().split(" ");
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (String time : playTime) {
			int temp = Integer.parseInt(time);
			list.add(temp);
		}
		
		String[] playDate = playInfoVO.getPlayDay().split(" ");
		ArrayList<String> dateArr = new ArrayList<String>();
		for (String date : playDate) {
			dateArr.add(date);
		}
		
		model.addAttribute("playDay", dateArr);
		model.addAttribute("viewTime", list);
		model.addAttribute("idxT", idxT);
		model.addAttribute("playTicketVO", playTicketVO);
		model.addAttribute("currentPage", currentPage);
		
		return "modifyPlayTicketInfo";
	}
	
	
	@ResponseBody
	@RequestMapping("/updateTicketInfo")
	public String updateTicketInfo (@RequestBody String json) {
		logger.info("homeController -> updateTicketInfo()");
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> jsonMap = null;
		try {
			jsonMap = objectMapper.readValue(json, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		PlayTicketVO playTicketVO = ctx.getBean("playTicket", PlayTicketVO.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String idxTStr = (String) jsonMap.get("idxT");
		int idxT = Integer.parseInt(idxTStr);
	
		
		playTicketVO.setIdxT(idxT);
		playTicketVO.setViewer((String)jsonMap.get("viewer"));
		playTicketVO.setViewDate((String)jsonMap.get("viewDate"));
		playTicketVO.setViewTime((String)jsonMap.get("viewTime"));
		playTicketVO.setPhone((String)jsonMap.get("phone"));
		playTicketVO.setEmail((String)jsonMap.get("email"));
		
		int result = playTicketService.updateTicketInfo(mapper, playTicketVO);
		
		
		return result + "";
	}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/cancelBooking")
	public String cancelBooking(HttpServletRequest request) {
//		logger.info("homeController -> cancelBooking()");
		int idxT = Integer.parseInt( request.getParameter("idxT") );
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketService playTicketService = ctx.getBean("playTicketService", PlayTicketService.class);
		PlayInfoService playInfoService = ctx.getBean("playInfoService", PlayInfoService.class);
		CardService cardService = ctx.getBean("cardService", CardService.class);
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		PlayTicketVO playTicketVO = playTicketService.getOrderTicketForCancel(mapper, idxT);
//		System.out.println("homeController -> cancelBooking() -> playTicketVO -> " + playTicketVO);
		String chargeKey = playTicketVO.getChargeKey();
		int amount = playTicketVO.getAmount();
		cardCheckParame cardCheckParame = new cardCheckParame();
		cardCheckParame.setAmount(amount);
		cardCheckParame.setChargeKey(chargeKey);
//		티켓 테이블에서 취소 티켓 삭제
		int result_1 = playTicketService.cancelBooking(mapper, idxT);
		int resultFinal = 0;
		if (result_1 == 1) {
//			카드 테이블에서 결제내역 삭제
			int result_2 = cardService.cancelCharge(mapper, cardCheckParame); 
			if (result_2 == 1) {
//		orderCount down
				int idxP = playTicketVO.getPlayInfoConnect();
				resultFinal = playInfoService.downOrderCount(mapper, idxP);
			}
		} else {
			System.out.println("티켓 테이블 취소 티켓 삭제 실패");
		}
		
		
		return resultFinal + "";
	}
	
	
	
	
	
	
	@RequestMapping("/qr_ticket")
	public String qrTicket(HttpServletRequest request, Model model) {
//		logger.info("homeController -> qrTicket()");
//		String playTitle = request.getParameter("playTitle");
//		String bookNumber = request.getParameter("bookNumber");
//		String viewer = request.getParameter("viewer");
//		String viewDate = request.getParameter("viewDate");
//		int viewerCount = Integer.parseInt( request.getParameter("viewerCount") );
//		String viewPlace = request.getParameter("viewPlace");
//		String viewTime = request.getParameter("viewTime");
//		String phone = request.getParameter("phone");
//		
//		
//		model.addAttribute("playTitle", playTitle );
//		model.addAttribute("bookNumber", bookNumber);
//		model.addAttribute("viewer", viewer);
//		model.addAttribute("viewDate", viewDate );
//		model.addAttribute("viewerCount",  viewerCount);
//		model.addAttribute("viewPlace", viewPlace );
//		model.addAttribute("viewTime", viewTime );
//		model.addAttribute("phone", phone );
//		
		
		return "QR_Ticket_Info";
	}
	
	
	@RequestMapping("/block")
	public String block (HttpServletRequest request, Model model) {
		
		return "block";
	}
	
	
	@RequestMapping("/errorPage")
	public String errorPage () {
		System.out.println("에러페이지 입장하십니다.");
		return "errorPage";
	}
	
	@ResponseBody
	@RequestMapping("/deleteSessionValue")
	public String deleteSessionValue (HttpServletRequest request) {
		HttpSession session = request.getSession();
		String result = "";
		try { 
			session.removeAttribute("blockReload");
			result += 200; 
		} catch (NullPointerException e) {
			System.out.println("blockReload 에러");
			result += 400;
		}
		
			return result;
	}
	
}
