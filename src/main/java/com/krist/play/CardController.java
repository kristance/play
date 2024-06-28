package com.krist.play;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.krist.play.dao.MainDAO;
import com.krist.play.service.PaymentService;
import com.krist.play.vo.CardVO;

@Controller
public class CardController {

	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@ResponseBody
	@RequestMapping("/checkCardOwner")
	public String checkCardOwner (@RequestBody String cardInfoJson, HttpServletRequest request) {
		logger.info("homeController -> checkCardOwner()");
		int result = 0;

		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> cardInfo = null;
		try {
			cardInfo = objectMapper.readValue(cardInfoJson, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException x) {
		}
		//System.out.println("homeContoller -> checkCardOwner() -> cardInfo -> " + cardInfo);
		
		String cardNumber = (String)cardInfo.get("cardNumber");
		MessageDigest md = null;
		byte[] sha = null;
		try {
			md = MessageDigest.getInstance("sha256");
			md.update(cardNumber.getBytes("utf-8"));
			sha = md.digest();
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException y) {
			y.printStackTrace();
		}
		StringBuilder cardNoAmho = new StringBuilder();
		for (int i = 0; i < sha.length ; i++) {
			cardNoAmho.append(Integer.toString((0xff & sha[i]) + 0x100, 16 ).substring(1));
			
		}
		
		String owner = (String) cardInfo.get("owner");
		String ownerAmho = "";
		try {
			ownerAmho =  Base64.getEncoder().encodeToString(owner.getBytes("utf-8"));
		} catch (UnsupportedEncodingException z) {
			System.out.println("소유자 문제 발생");
		}
		
		// 카드번호 sha256
		// 유효기간  :expDate
		
		
		System.out.println("homeController -> checkCardOwner() -> cardNoAmho -> " + cardNoAmho.toString());
		
		
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PaymentService paymentService = ctx.getBean("paymentService", PaymentService.class);
		CardVO cardVO = ctx.getBean("card", CardVO.class);
		cardVO.setCardName((String) cardInfo.get("kindOfCard"));
		cardVO.setCardNoAmho(cardNoAmho.toString());
		cardVO.setExpDate((String) cardInfo.get("expDate"));
		cardVO.setOwnerAmho(ownerAmho);
		
		System.out.println("homeController -> checkCardOwner() -> cardInfo -> " + cardVO);
		result = paymentService.checkCardValid(mapper, cardVO);
		
				
		return result + "";
	}
	
	@ResponseBody
	@RequestMapping("/isYourCardPassword")
	public String isYourCardPassword(@RequestBody String cardInfoJson, HttpServletRequest request ) {
		logger.info("homeController -> isYourCardPassword()");
		ObjectMapper objectMapper = new ObjectMapper();
			
		Map<String, Object> cardInfo = null;
		try {
			cardInfo = objectMapper.readValue(cardInfoJson, new TypeReference<Map<String, Object>>() {
			});
		} catch (JsonProcessingException e) {
		}
		
		String cardNumber = (String)cardInfo.get("cardNumber");
		MessageDigest md = null;
		byte[] sha = null;
		try {
			md = MessageDigest.getInstance("sha256");
			md.update(cardNumber.getBytes("utf-8"));
			sha = md.digest();
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		StringBuilder cardNoAmho = new StringBuilder();
		for (int i = 0; i < sha.length ; i++) {
			cardNoAmho.append(Integer.toString((0xff & sha[i]) + 0x100, 16 ).substring(1));
			
		}
		
		String owner = (String) cardInfo.get("owner");
		String ownerAmho = "";
		try {
			ownerAmho =  Base64.getEncoder().encodeToString(owner.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("소유자 문제 발생");
		}
		
		
		
		
		String password = (String) cardInfo.get("password");
		byte[] sha1 = null;
		try {
			md.update(password.getBytes("utf-8"));
			sha1 = md.digest();
		} catch (UnsupportedEncodingException e) {
		}
		
		StringBuilder passwordAmho = new StringBuilder();
		for (int j = 0; j < sha1.length;j++) {
			passwordAmho.append( Integer.toString( (0xff & sha1[j]) + 0x100, 16 ).substring(1) );
		}
		
		
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PaymentService paymentService = ctx.getBean("paymentService", PaymentService.class);
		CardVO cardVO = ctx.getBean("card", CardVO.class);
		cardVO.setCardName((String) cardInfo.get("kindOfCard"));
		cardVO.setCardNoAmho(cardNoAmho.toString());
		cardVO.setPasswordAmho(passwordAmho.toString());
		cardVO.setExpDate((String) cardInfo.get("expDate"));
		cardVO.setOwnerAmho(ownerAmho);
		
		
		int result = paymentService.payUsingCard(mapper, cardVO);
		String enc = "";
		int idxCard = 0;
		if (result  == 1) {
//			카드번호 일치  
			idxCard = paymentService.getCardIdx(mapper, cardVO);
			UUID uuid = UUID.randomUUID();
			String uuidStr[] = uuid.toString().trim().split("-");
			String temp1 = "";
			String temp2 = "";
			try {
				 temp1 = Base64.getEncoder().encodeToString(uuidStr[0].getBytes("utf-8"));
				 temp2 = Base64.getEncoder().encodeToString(uuidStr[1].getBytes("utf-8"));
			} catch (UnsupportedEncodingException e) {
			}
			
			enc = temp1 + temp2;
			System.out.println("enc -> " + enc);
		} else {
//			카드번호 불일치 
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);
		returnMap.put("chargeKey", enc);
		returnMap.put("idxCard", idxCard);
		
		String returnJson = "";
		try {
			returnJson = objectMapper.writeValueAsString(returnMap);
		} catch (JsonProcessingException e) {
		} 
		
//		System.out.println("homeController -> isYourCardPassword() -> passwordAmho -> " + passwordAmho);
//		System.out.println("homeController -> isYourCardPassword() -> result -> " + result);
		
		
		
		return returnJson;
	}
	
	
	
	
	
	
	
	
}
