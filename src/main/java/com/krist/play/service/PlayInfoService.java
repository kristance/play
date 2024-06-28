package com.krist.play.service;

import java.util.HashMap;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.Parame;
import com.krist.play.vo.PlayInfoList;
import com.krist.play.vo.PlayInfoVO;

public class PlayInfoService {

//	booking 페이지
	public PlayInfoList getPlayAllList(int currentPage, MainDAO mapper) {
		System.out.println("Play_infoService -> getPlayAllList() ");
		int totalCount = mapper.getTotalCount();
		System.out.println("totalCount -> " + totalCount);
		int pageSize = 5;
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayInfoList list = ctx.getBean("playInfoList", PlayInfoList.class);
		list.setInit(currentPage, totalCount, pageSize);
		list.setList(mapper.getPlayTotalList(list));
		System.out.println("play_infoService -> getPlayAllList() -> play_infoList -> " + list);
		return list;
	}

//	idxP -> getPlayinfo
	public PlayInfoVO getPlayInfo(MainDAO mapper, int idxP) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayInfoVO playInfoVO = ctx.getBean("playInfo", PlayInfoVO.class);
		playInfoVO = mapper.getPlayInfo(idxP);
		return playInfoVO;
	}


//	공연 리스트 페이지 ----------------------------------------------
//	예매율 1위 playinfoVO
	public PlayInfoVO getPlayInfo_playList(MainDAO mapper) {
		PlayInfoVO playInfoVO = mapper.getPlayInfo_playList();
		return playInfoVO;
	}

//	현재 상영중인 공연 리스트의 totalCount
	public PlayInfoList getPlayList(MainDAO mapper, int currentPage) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		int pageSize = 5;
		int totalCount = mapper.getTotalCount_playList();
		PlayInfoList playInfoList = ctx.getBean("playInfoList", PlayInfoList.class);
		playInfoList.setInit(currentPage, totalCount, pageSize);
		playInfoList.setList(mapper.getPlayList_playList(playInfoList));
		System.out.println("play_infoService -> getPlayList() -> playInfoList -> " + playInfoList);
		
		
		return playInfoList;
	}

// 공연 정보 상세 depth 1
	public PlayInfoVO getplayinfo_playInfo(MainDAO mapper, int idxP) {
		PlayInfoVO playInfoVO = mapper.getplayinfo_playInfo(idxP);
		return playInfoVO;
	}

//	공연 정보 상세 depth 2
	public PlayInfoVO getPlayInfo_playInfoDetail(MainDAO mapper, int idxP) {
		PlayInfoVO playInfoVO = mapper.getPlayInfo_playInfoDetail(idxP);
		return playInfoVO;
	}

	
//	공연 후기와 공연 정보를 연결하기 위한  idxP를 불러온다.
	public int getPlayInfo_saveReply(MainDAO mapper, Parame parame) {
		int result = mapper.getPlayInfo_saveReply(parame);
		
		return result;
	}

	
//	공연 후기 읽기 페이지 - 별점, 제목을 출력하기 위해 공연 정보를 불러옴
	public PlayInfoVO getPlayInfo_AfterViewReplyRead(MainDAO mapper, int idxP) {
			PlayInfoVO playInfoVO = mapper.getPlayInfo_AfterViewReplyRead(idxP);
		return playInfoVO;
	}

	
//	예약 확인 페이지 - 취소 티켓의 공연 정보의 예약 횟수를 줄인다.
	@Transactional(rollbackFor = {NullPointerException.class})
	public int downOrderCount(MainDAO mapper, int idxP) {
		int result = mapper.downOrderCount(idxP);
		return result;
	}

	
//	예약 확인 페이지 - 예약 변경을 위해 공연 정보를 불러온다.
	public PlayInfoVO getPlayInfoForModify(MainDAO mapper, int idxP) {
		PlayInfoVO playInfoVO = mapper.getPlayInfoForModify(idxP);
		return playInfoVO;
	}

	
//	공연 후기 저장 페이지 - 평균 별점을 공연 정보에 등록한다.
	public int updateStar(MainDAO mapper, PlayInfoVO playInfoVO) {
		int res = mapper.updateStar(playInfoVO);
		return res;
	}





	

	

}
