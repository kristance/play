package com.krist.play.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.MemberVO;
import com.krist.play.vo.PlayTicketVO;

public class MemberService {

	
//	id 중복 체크
	public int idCheck(MainDAO mapper, String id) {
		int idCheck = mapper.idCheck(id);
		return idCheck;
	}

//	회원가입
	public int signUp(MainDAO mapper, MemberVO memberVO) {
		int result = mapper.signUp(memberVO);
//		System.out.println("memberService -> signUp -> memberVO 커맨드 객체 -> " + memberVO);
		return result;
	}

//	비회원이 티켓 예약을 할 경우 member 테이블에 id가 anonymous로 등록
	@Transactional
	public int saveMember(MainDAO mapper, PlayTicketVO playTicketVO) {
		int res = mapper.saveMember(playTicketVO);
//		System.out.println("MemberService -> saveMember() -> " + res);
		return res;
	}

//	회원정보 1건 비회원 로그인
	public MemberVO getMemberInfo(MainDAO mapper, PlayTicketVO playTicketVO) {
		MemberVO memberVO = mapper.getMemberInfo(playTicketVO);
		System.out.println("\nMemberService -> getMemberInfo() -> playTicketVO -> " + playTicketVO);
		System.out.println("MemberService -> getMemberInfo() -> memberVO -> " + memberVO);
		return memberVO;
	}

//	loginNotB 로그인 
	public int getLoginCheck(MainDAO mapper, MemberVO memberVO) {
		int result = mapper.getLoginCheck(memberVO);
		return result;
	}

	
//	회원정보 1건 - id
	public MemberVO getMemberInfoId(MainDAO mapper, String id) {
		MemberVO memberVO = mapper.getMemberInfoId(id); 
//		System.out.println("memberService -> getMemberInfo -> memberVO -> " + memberVO);
		return memberVO;
	}

//	회원 정보 수정 ------------------------------------
//	회원 정보 수정폼의 디폴트 값
	public MemberVO getMemberInfo_modifyInfo(MainDAO mapper, int idxM) {
		MemberVO memberVO = mapper.getMemberInfo_modifyInfo(idxM);
		System.out.println("memberService -> getMemberInfo_modifyInfo -> memberVO -> " + memberVO);
		
		return memberVO;
	}
// 회원 정보 수정
	public int modifyMemberInfo(MainDAO mapper, MemberVO memberVO) {
		System.out.println("memberService -> modifyMemberInfo -> memberVO -> " + memberVO);
		
		int result = mapper.modifyMemberInfo(memberVO);
		return result;
	}

	
//	회원 탈퇴
	public int signOut(MainDAO mapper, Map<String, Object> jsonMap) {
		System.out.println("memberService -> signOut()");
		
		int result = mapper.signOut(jsonMap);
		return result;
	}

	
	
//	공연 후기 읽기 페이지에서 프로필 사진을 가져오기 위해 멤버 정보를 얻어옴 - 공연 후기 읽기
	public MemberVO getMemberInfo_AfterVieewReplyRead(MainDAO mapper, int idxM) {
		MemberVO memberVO = mapper.getMemberInfo_AfterVieewReplyRead(idxM);
		return memberVO;
	}

	
	
//	공연 후기 수정 페이지의 프로필 사진을 가져오기 위해 멤버 정보를 얻어옴  - 공연 후기 수정
	public MemberVO getMemberInfo_modifyReplyform(MainDAO mapper, int idxM) {
		MemberVO memberVO = mapper.getMemberInfo_modifyReplyform(idxM);
		return memberVO;
	}

	
//	예약 확인 페이지 - 회원 정보 수정페이지의 이미지 출력을 위해 읽어옴
	public MemberVO getMemberProfile(MainDAO mapper, int idxM) {
		MemberVO memberVO = mapper.getMemberProfile(idxM);
		return memberVO;
	}

//  회원 가입 페이지 - 회원 가입 전 동일한 정보로 가입되어있는지 확인
	public int checkCountSignUp(MainDAO mapper, MemberVO memberVO) {
		int checkCount = mapper.checkCountSignUp(memberVO);
		return checkCount;
	}

	
//	아이디 / 비밀번호 찾기 페이지 - 아이디 찾기 
	public String searchPasswordForIdForm(MainDAO mapper, HashMap<String, String> hmap) {
		String id = mapper.searchPasswordForIdForm(hmap);
		return id;
	}

	
//	아이디 / 비밀번호 찾기 페이지 - 비밀번호 찾기 
	public String searchPasswordForPassForm(MainDAO mapper, HashMap<String, String> jsonMap) {
		String password = mapper.searchPasswordForPassForm(jsonMap);
		return password;
	}

	

}
