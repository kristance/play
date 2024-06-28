package com.krist.play.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.krist.play.dao.MainDAO;
import com.krist.play.vo.PlayReplyList;
import com.krist.play.vo.PlayReplyVO;
import com.krist.play.vo.SearchParame;

public class PlayReplyService {

	
//	초기 공연 리스트
	public PlayReplyList getReplyList(MainDAO mapper, int currentPage) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		int pageSize = 7;
		int totalCount = mapper.getTotalCount_AfterViewReplyList();
		
		PlayReplyList playReplyList = ctx.getBean("playReplyList", PlayReplyList.class);
		playReplyList.setInit(currentPage, totalCount, pageSize);
//		System.out.println("playReplyService -> getReplyList() -> playReplyList1 -> " + playReplyList);
		playReplyList.setList(mapper.getPlayReply_afterViewReplyList(playReplyList));
		
		
		return playReplyList;
	}


	
//	로그인한 계정의 주인이 본 공연이 있는지 없는지 확인
	public int canYouSawPlay(MainDAO mapper, String id) {
		int result = mapper.canYouSawPlay(id);
		return result;
	}

	
//	공연 후기 저장
	@Transactional (rollbackFor = {NullPointerException.class})
	public int saveReply(MainDAO mapper, PlayReplyVO playReplyVO) {
		int result = mapper.saveReply(playReplyVO);
		try {
			if (result != 1) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			result = 0; 
		}
		return result;
	}

	
	
//	저장된 공연 후기 읽어오기 - 공연 후기 읽기
	public PlayReplyVO getReplyInfo(MainDAO mapper, int idxC) {
		PlayReplyVO playReplyVO = mapper.getReplyInfo(idxC);
		
		return playReplyVO;
	}

	
//	카테고리가 제목일 때 검색
	public PlayReplyList getSearchListForSubject(MainDAO mapper, String keyword, int currentPage) {
		System.out.println("playReplyService -> getSearchListForSubject()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyList playReplyList = ctx.getBean("playReplyList", PlayReplyList.class);
		int totalSize = 7;
		int totalCount = mapper.getTotalCountForSubject_AVRR(keyword);
		playReplyList.setInit(currentPage, totalCount, totalSize);
		
		SearchParame searchParame = new SearchParame();
		searchParame.setKeyword(keyword);
		searchParame.setList(playReplyList);
		
		playReplyList.setList(mapper.getSearchListForSubject(searchParame));
		
		
		
		return playReplyList;
	}

//	카테고리가 viewer일 때 검색
	public PlayReplyList getSearchListForViewer(MainDAO mapper, String keyword, int currentPage) {
		System.out.println("playReplyService -> getSearchListForViewer()");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/appCTX.xml");
		PlayReplyList playReplyList = ctx.getBean("playReplyList", PlayReplyList.class);
		int totalSize = 7;
		int totalCount = mapper.getTotalCountForViewer_AVRR(keyword);
		playReplyList.setInit(currentPage, totalCount, totalSize);
		
		SearchParame searchParame = new SearchParame();
		searchParame.setKeyword(keyword);
		searchParame.setList(playReplyList);
		
		playReplyList.setList(mapper.getSearchListForViewer(searchParame));
		
		return playReplyList;
	}

	
//	공연 후기의 조회수를 올림
	public int upReplyViewCount(MainDAO mapper, int idxC) {
		int result = mapper.upReplyViewCount(idxC);
		return result;
	}

	
//	공연 후기 수정을 위해 후기 1건 불러온다.
	public PlayReplyVO getReplyInfoForModify(MainDAO mapper, int idxC) {
		PlayReplyVO playReplyVO = mapper.getReplyInfoForModify(idxC);
		
		return playReplyVO;
	}

	
//	공연 후기 수정 페이지 - 공연 후기를 업데이트하기 위해 저장된 후기를 불러옴
	public PlayReplyVO getReplyInfoForUpdate(MainDAO mapper, int idxC) {
		PlayReplyVO playReplyVO = mapper.getReplyInfoForUpdate(idxC);
		return playReplyVO;
	}

	
//	공연 후기 수정 페이지 - 공연 후기를 업데이트한다.
	@Transactional(rollbackFor = {NullPointerException.class})
	public int updateAfterViewReply(MainDAO mapper, PlayReplyVO playReplyVO) {
		int result = mapper.updateAfterViewReply(playReplyVO);
		try {
			if (result != 1) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			result = 0;
		}
		return result;
	}

// 공연 후기 수정 페이지 - 공연 후기 업데이트 이미지 수정파일을 저장
	@Transactional(rollbackFor = {IllegalStateException.class, IOException.class})
	public PlayReplyVO updateSaveFile(MultipartFile[] image, PlayReplyVO playReplyVO, String id) {
		for (MultipartFile f : image) {
			String originName = f.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String savedImageRoot = playReplyVO.getImageReply();
			String savedImageRootExt = savedImageRoot.substring(savedImageRoot.lastIndexOf("."));
			
			String extension = "";
			if (ext.equalsIgnoreCase(savedImageRootExt)) {
				extension = ext;
			} else {
				extension = savedImageRootExt;
			}
			String loc2= playReplyVO.getImageReply().split("/")[2];
			String loc = "playStorage" + File.separator +
					id + File.separator +
					"reply" + File.separator + 
					loc2 + File.separator +
					"replyImage" + extension;
			try {
				f.transferTo(new File(loc));
				playReplyVO.setImageReply(id + File.separator +
						"reply" + File.separator +
						loc2 + File.separator + "replyImage" + extension);
			} catch (IllegalStateException | IOException e) {
				System.out.println("공연 후기 수정 에러 발생");
			}
			
		}
		return playReplyVO;
	}
	
	
	

// saveReply 파일 저장
	@Transactional(rollbackFor = {IllegalStateException.class, IOException.class})
	public String saveFile(MultipartFile[] file, File storage) {
		
		String ext = "";
		for (MultipartFile image : file) {
			String imageFileName = image.getOriginalFilename();
//			System.out.println("saveReply -> " + imageFileName);
			ext = imageFileName.substring(imageFileName.lastIndexOf("."));
//			System.out.println("ext -> " + ext);
			String loc = "";
			try {
				loc = storage + File.separator + "replyImage" + ext;
				image.transferTo(new File(loc));
			} catch (IllegalStateException | IOException e) {
				System.out.println("playrReplyService -> savefile -> 공연 후기 이미지 저장 실패");
			}
		}
		
		
		return ext;
	}






	
	
	
	
	
	

}
