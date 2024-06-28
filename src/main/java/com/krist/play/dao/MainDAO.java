package com.krist.play.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.krist.play.vo.CardChargeListVO;
import com.krist.play.vo.CardVO;
import com.krist.play.vo.MemberVO;
import com.krist.play.vo.Parame;
import com.krist.play.vo.PlayInfoList;
import com.krist.play.vo.PlayInfoVO;
import com.krist.play.vo.PlayReplyList;
import com.krist.play.vo.PlayReplyVO;
import com.krist.play.vo.PlayTicketList;
import com.krist.play.vo.PlayTicketVO;
import com.krist.play.vo.SearchParame;
import com.krist.play.vo.cardCheckParame;

public interface MainDAO {

//	totalCount
	int getTotalCount();

//	totalList
	ArrayList<PlayInfoVO> getPlayTotalList(PlayInfoList list);

//	One playInfo
	PlayInfoVO getPlayInfo(int idxP);

//	loginNotB 로그인 
	int getLoginCheck(MemberVO memberVO);

//	anonymoususerinfo count
	int getAnonymousUserInfo(PlayTicketVO playTicketVO);

//	save Ticket
	int saveTicket(PlayTicketVO playTicketVO);

//	id 중복체크
	int idCheck(String id);

//	회원가입
	int signUp(MemberVO memberVO);

//	예약 수 올리기
	void upOrderCount(int idxP);

//	비회원 member 테이블 등록
	int saveMember(PlayTicketVO playTicketVO);


//	회원정보 중 idxM 1건 get
	MemberVO getMemberInfo(PlayTicketVO playTicketVO);

//	회원정보 1건 - id
	MemberVO getMemberInfoId(String id);


//	회원정보  얻기 위해 전화번호 이메일 얻기
	MemberVO getPhoneEmail(String id);
	
//	카드 데이터베이스 카드 정보와 입력된 카드 정보가 일치하는지 확인
	int checkCardValid(CardVO cardVO);

//	카드 비밀번호가 일치하는지 확인
	int payUsingCard(CardVO cardVO);

//	예약 확인 페이지 ------------------------------------------
	
//	예약 티켓 리스트 - totalCount 얻기 - 로그인 O 
	int getTotalCountLoginO(int idxM);
	
//	예약 티켓 리스트 -  로그인 O 
	ArrayList<PlayTicketVO> getOrderedTicketLoginO(PlayTicketList playTicketList);

//	예약 티켓 리스트 작성을 위한 티켓 1건 정보 불러오기; memberconnect
	PlayTicketVO getMemberInfo_BookingCheckList(String bookNumber);

//	예약 티켓 리스트 - totalCount 얻기 - 로그인 X 
	int getTotalCountLoginX(int idxM);

//	예약 티켓 리스트 -  로그인 X 
	ArrayList<PlayTicketVO> getOrderedTicketLoginX(PlayTicketList playTicketList);

//	관람객 이름 표시 위함 ; viewer
	PlayTicketVO getMemberInfo_bookCheckList(String bookNumber);

//	회원 정보 수정 ----------------------------------------------
	
//	회원 정보 수정폼의 디폴트값
	MemberVO getMemberInfo_modifyInfo(int idxM);

//	회원 정보 수정
	int modifyMemberInfo(MemberVO memberVO);

//	회원탈퇴
	int signOut(Map<String, Object> jsonMap);
	
	
//	공연 리스트 페이지 --------------------------------------------
//	예매율 1위 playinfoVO
	PlayInfoVO getPlayInfo_playList();

//	현재 상영 중인 공연 리스트의 totalCount
	int getTotalCount_playList();

//	현재 상영 중인 공연 리스트
	ArrayList<PlayInfoVO> getPlayList_playList(PlayInfoList playInfoList);

//	공연 정보 상세 depth 1
	PlayInfoVO getplayinfo_playInfo(int idxP);

//	공연 정보 상세 depth 2
	PlayInfoVO getPlayInfo_playInfoDetail(int idxP);

	
//	공연 후기 페이지 -------------------------------------------------------
//	공연 후기 리스트 totalCount
	int getTotalCount_AfterViewReplyList();

//	공연 후기 리스트
	ArrayList<PlayReplyVO> getPlayReply_afterViewReplyList(PlayReplyList playReplyList);

	
//	봤던 공연 선택 박스
	ArrayList<PlayTicketVO> getViewedTitle_AfterViewReplyWrite(String loginId);

	
//	로그인한 계정의 주인이 봤던 공연이 있는지 없는지
	int canYouSawPlay(String id);

//	공연 후기와 공연 정보를 연결하기 위한  idxP를 불러온다.
	int getPlayInfo_saveReply(Parame parame);

//	공연 후기 저장
	int saveReply(PlayReplyVO playReplyVO);

	
	
//	저장된 공연 후기 읽어오기 - 공연 후기 읽기
	PlayReplyVO getReplyInfo(int idxC);
	
	
	
//	공연 후기 읽기 페이지에서 프로필 사진을 가져오기 위해 멤버 정보를 얻어옴 - 공연 후기 읽기
	MemberVO getMemberInfo_AfterVieewReplyRead(int idxM);

	
//	카드 데이터 베이스 결제 리스트에 차징키를 등록하기 위해 데이터베이스 카드 idx 불러오기
	int getCardIdx(CardVO cardVO);

	
	
//	카드 데이터베이스의 결제 내역에 결제 내역을 추가
	int insertChargeList(CardChargeListVO cardChargeListVO);

//	예약 확인 페이지 - 예약한 티켓 정보
	PlayTicketVO getOrderedTicketInfo_ticketInfo(int idxT);

	
//	예약 확인 페이지 - 예약한 티켓을 취소하기 위해 정보를 얻어옴
	PlayTicketVO getOrderTicketForCancel(int idxT);

	
//	예약 확인 페이지 - 티켓 테이블에서 취소 티켓 삭제
	int cancelBooking(int idxT);

	
//	예약 확인 페이지 -카드 테이블에서 취소 티켓 카드 결제 내역 삭제
	int cancelCharge(cardCheckParame cardCheckParame);

	
//	예약 확인 페이지 - 취소 티켓의 공연 정보의 예약 횟수를 줄인다.
	int downOrderCount(int idxP);

	
	
//	카테고리가 제목일 때 검색 - totalCount
	int getTotalCountForSubject_AVRR(String keyword);

	
//	카테고리가 viewer일 때 검색 - totalCount
	int getTotalCountForViewer_AVRR(String keyword);

	
//	카테고리가 제목일 때 검색 리스트
	ArrayList<PlayReplyVO> getSearchListForSubject(SearchParame searchParame);


//	카테고리가 viewer일 때 검색 리스트
	ArrayList<PlayReplyVO> getSearchListForViewer(SearchParame searchParame);

	
//	예약 확인 페이지 - 예약 수정하기 위해 티켓 정보 읽기
	PlayTicketVO getOrderedTicketInfo(int idxT);

	
//	예약 확인 페이지 - 예약 수정하기 위해 공연 정보를 불러온다.
	PlayInfoVO getPlayInfoForModify(int idxP);

	
//	예약 확인 페이지 - 예약 수정
	int updateTicketInfo(PlayTicketVO playTicketVO);

	
//	공연 후기의 조회수를 올림
	int upReplyViewCount(int idxC);

	
//	공연 후기 저장 페이지 - 평균 별점을 위해 본 사람을 불러온다.
	int getAfterViewerCount(int idxP);

	
//	공연 후기 저장 페이지 - 평균 별점을 위해 본 사람의 별점을 모두 더한 값을 불러온다.
	int getTotalStar(int idxP);

	
//	공연 후기 저장 페이지 - 평균 별점을 공연 정보에 저장한다
	int updateStar(PlayInfoVO playInfoVO);

	
//	공연 후기 수정 페이지 - 공연 후기 수정을 위해 후기 1건을 불러온다.
	PlayReplyVO getReplyInfoForModify(int idxC);

	
//	공연 후기 수정 페이지의 프로필 사진을 가져오기 위해 멤버 정보를 얻어옴  - 공연 후기 수정
	MemberVO getMemberInfo_modifyReplyform(int idxM);

	
//	예약 확인 페이지 - 회원 정보 수정페이지의  profile이미지 출력을 위해 불러옴
	MemberVO getMemberProfile(int idxM);

	
	
// 공연 후기 수정 페이지 - 공연 후기를 업데이트하기 위해 저장된 후기를 불러옴
	PlayReplyVO getReplyInfoForUpdate(int idxC);

	
	
	
//	공연 후기 수정 페이지 - 공연 후기 업데이트 한다.
	int updateAfterViewReply(PlayReplyVO playReplyVO);

	
//	 공연 후기 읽기 페이지 - 별점, 제목을 출력하기 위해 공연 정보를 불러옴
	PlayInfoVO getPlayInfo_AfterViewReplyRead(int idxP);

	
//	공연 후기 작성 페이지 - 별점을 매긴 티켓의 starTrigger를 on으로 바꾼다.
	int turnStarTrigger(int idxT);

	
//	공연 후기 작성 페이지 - 공연 제목 표시를  위해 공연 제목을 불러옴
	String getTitle(int idxT);

	
//	메인페이지 carousel
	ArrayList<PlayInfoVO> getMainCarousel();

//	회원 가입 페이지 - 회원 가입 전에 동일한 정보로 가입되어있는 아이디가 있는지 확인
	int checkCountSignUp(MemberVO memberVO);

	
// 	아이디/ 비밀번호 찾기 페이지 - 아이디 찾기 
	String searchPasswordForIdForm(HashMap<String, String> hmap);

	
// 	아이디/ 비밀번호 찾기 페이지 - 비밀번호  찾기 
	String searchPasswordForPassForm(HashMap<String, String> jsonMap);

	
//	예약 페이지 - 티켓 저장하기 전 중복 저장된 것 있나 확인 
	int beforeSave(PlayTicketVO playTicketVO);

//	에약 페이지 - 카드 결제 데이터베이스에 저장하기 전 동일 결제 내역이 있나 확인
	int beforeCharge(CardChargeListVO cardChargeListVO);

	
	

	

	

	

	
	





	

	
	


}
