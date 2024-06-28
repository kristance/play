package com.krist.play.service;

import org.springframework.transaction.annotation.Transactional;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.CardVO;
	
public class PaymentService {

//	카드 데이터 베이스의 데이터와 입력한 데이터가 일치하는 지 확인
	public int checkCardValid(MainDAO mapper, CardVO cardVO) {
		System.out.println("PaymentService -> checkCardValid()");
		int result = mapper.checkCardValid(cardVO);
		return result;
	}

//	카드 비밀번호가 일치하는지 데이터 베이스와 확인
	@Transactional(rollbackFor = {NullPointerException.class})
	public int payUsingCard(MainDAO mapper, CardVO cardVO) {
		System.out.println("PaymentService -> payUsingCard()");
		int result = mapper.payUsingCard(cardVO);
		try {
			if ( result != 1) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
		}
		return result;
	}

	
	@Transactional
//	카드 데이터 베이스 결제 리스트에 차징키를 등록하기 위해 데이터베이스 카드 idx 불러오기
	public int getCardIdx(MainDAO mapper, CardVO cardVO) {
		int idxCard = mapper.getCardIdx(cardVO);
		return idxCard;
	}
	
}
