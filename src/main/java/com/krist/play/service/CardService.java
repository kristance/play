package com.krist.play.service;

import org.springframework.transaction.annotation.Transactional;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.CardChargeListVO;
import com.krist.play.vo.cardCheckParame;

public class CardService {

	
//	카드 데이터베이스의 결제 내역에 결제 내역을 추가
	@Transactional(rollbackFor = {NullPointerException.class})
	public int insertChargeList(MainDAO mapper, CardChargeListVO cardChargeListVO) {
		int beforeCharge = mapper.beforeCharge(cardChargeListVO);
		int cardSaveResult = 0;
		try {
			if (beforeCharge != 0) {
				throw new NullPointerException();
			} else {
				cardSaveResult = mapper.insertChargeList(cardChargeListVO);
			}
		} catch (NullPointerException e) {
			cardSaveResult = 0;
		}
		
		return cardSaveResult;
	}

//	카드테이블에서  취소 티켓 카드 결제 내역 삭제
	@Transactional(rollbackFor = {NullPointerException.class})
	public int cancelCharge(MainDAO mapper, cardCheckParame cardCheckParame) {
		int result = mapper.cancelCharge(cardCheckParame);
		return result;
	}

}
