package com.krist.play.service;

import java.util.ArrayList;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.MemberVO;
import com.krist.play.vo.PlayInfoList;
import com.krist.play.vo.PlayInfoVO;
import com.krist.play.vo.PlayTicketList;
import com.krist.play.vo.PlayTicketVO;

public class PlayTicketService {

	

// save ticketinfo in database
	@Transactional (rollbackFor = {NullPointerException.class})
	public int saveTicket(MainDAO mapper, PlayTicketVO playTicketVO) {
		int beforeSave = mapper.beforeSave(playTicketVO);
		int result = 0;
		try {
			if (beforeSave != 0) {
				throw new NullPointerException();
			} else {
				result = mapper.saveTicket(playTicketVO);
			}
		} catch (NullPointerException e) {
			result = 0; 
		}
		return result;
	}

//	예약 수 올리기
	public void upOrderCount(MainDAO mapper, int idxP) {
		mapper.upOrderCount(idxP);
		
	}

//	예약 확인 페이지 - 예약한 티켓 - 로그인 O
	public PlayTicketList getOrderedTicket(MainDAO mapper, int idxM, int currentPage) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketList playTicketList = ctx.getBean("playTicketList", PlayTicketList.class);
		PlayTicketVO playTicketVO = ctx.getBean("playTicket", PlayTicketVO.class);
		int pageSize = 6;
		int totalCount = mapper.getTotalCountLoginO(idxM);
//		System.out.println("playTicketService -> getOrderedTicket -> totalCount -> " + totalCount);
		playTicketList.setInit(currentPage, totalCount, pageSize);
		playTicketList.setIdxM(idxM);
		playTicketList.setList(mapper.getOrderedTicketLoginO(playTicketList));
//		System.out.println("playTicketService -> getOrderedTicket -> playTicketList -> " + playTicketList.toString());
		
		return playTicketList;
	}


//	예약 확인 페이지 - 예약한 티켓 - 로그인 X
	public PlayTicketList getOrderedTicketunLogin(MainDAO mapper, String bookNumber, int currentPage) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayTicketList playTicketList = ctx.getBean("playTicketList", PlayTicketList.class);
		int pageSize = 6;
		PlayTicketVO playTicketVO = mapper.getMemberInfo_BookingCheckList(bookNumber);
		int idxM = playTicketVO.getMemberConnect();
		int totalCount = mapper.getTotalCountLoginX(idxM);
//		System.out.println("PlayTicketService -> getOrderedTicketunLogin() -> totalCount -> " + totalCount);
		playTicketList.setInit(currentPage, totalCount, pageSize);
		playTicketList.setIdxM(idxM);
		playTicketList.setList(mapper.getOrderedTicketLoginX(playTicketList));
		
		return playTicketList;
	}

	
//	예약 확인 페이지 - 관람객 이름 표시 위함 ; viewer
	public PlayTicketVO getMemberInfo_bookCheckList(MainDAO mapper, String bookNumber) {
		PlayTicketVO playTicketVO = mapper.getMemberInfo_bookCheckList(bookNumber);
//		System.out.println("PlayTicketService -> getMemberInfo_bookCheckList() -> playTicketVO -> " + playTicketVO);
		
		return playTicketVO;
	}

	
//	예약 확인 페이지 - 예약한 티켓 정보
	public PlayTicketVO getOrderedTicketInfo_ticketInfo(MainDAO mapper, int idxT) {
		PlayTicketVO playTicketVO = mapper.getOrderedTicketInfo_ticketInfo(idxT);
		
		return playTicketVO;
	}

//	예약 확인 페이지 - 예약한 티켓을 취소하기 위해 정보를 얻어옴
	public PlayTicketVO getOrderTicketForCancel(MainDAO mapper, int idxT) {
		PlayTicketVO playTicketVO = mapper.getOrderTicketForCancel(idxT);
		return playTicketVO;
	}

//	예약 확인 페이지 - 티켓 테이블에서 취소 티켓 삭제
	@Transactional(rollbackFor = {NullPointerException.class})
	public int cancelBooking(MainDAO mapper, int idxT) {
		int result = mapper.cancelBooking(idxT);
		return result;
	}

	
//	예약 확인 페이지 - 예약 수정 하기 위해 기존 정보를 불러옴
	public PlayTicketVO getOrderedTicketInfo(MainDAO mapper, int idxT) {
		PlayTicketVO playTicketVO = mapper.getOrderedTicketInfo(idxT);
		return playTicketVO;
	}

	
	
//	예약 확인 페이지 - 예약 수정
	@Transactional (rollbackFor = {NullPointerException.class})
	public int updateTicketInfo(MainDAO mapper, PlayTicketVO playTicketVO) {
		int result = mapper.updateTicketInfo(playTicketVO);
		try {
			if (result != 1) {
				throw new NullPointerException();
			} else {
			}
		} catch (NullPointerException e) {
			result = 0;
		}
		return result;
	}

	
//	공연 후기 저장 페이지 - 평균 별점을 위해 본 사람의 수를 불어온다.
	public int getAfterViewerCount(MainDAO mapper, int idxP) {
		int afterViewerCount = mapper.getAfterViewerCount(idxP);
		return afterViewerCount;
	}

	
//	공연 후기 저장 페이지 - 평균 별점을 위해 본 사람들의 별점을 모두 더한 값을 불러온다.
	public int getTotalStar(MainDAO mapper, int idxP) {
		int totalStar = mapper.getTotalStar(idxP);
		return totalStar;
	}

	

//	공연 선택 박스
	public ArrayList<PlayTicketVO> getViewedTitle_AfterViewReplyWrite(MainDAO mapper, String loginId) {
		ArrayList<PlayTicketVO> result = mapper.getViewedTitle_AfterViewReplyWrite(loginId);
//		System.out.println("playReplyService -> getViewedTitle_AfterViewReplyWrite() -> result -> " + result.toString());
		return result;
	}

	
//	별점을 매긴 티켓의 starTrigger를 on으로 바꾼다.
	public int turnStarTrigger(MainDAO mapper, int idxT) {
		int conclusion = mapper.turnStarTrigger(idxT);
		return conclusion;
	}

//	공연 후기 작성 페이지 -> 공연 제목 표시를 위해 공연 제목 불러옴
	public String getTitle(MainDAO mapper, int idxT) {
		String playTitle = mapper.getTitle(idxT);
		return playTitle;
	}

	
//	메인 페이지 carousel 
	public ArrayList<PlayInfoVO> getMainCarousel(MainDAO mapper) {
		ArrayList<PlayInfoVO> list = mapper.getMainCarousel();
		return list;
	}



	
	
}