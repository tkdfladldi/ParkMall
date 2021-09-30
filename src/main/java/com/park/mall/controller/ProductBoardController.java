package com.park.mall.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.park.mall.model.MemberVO;
import com.park.mall.model.ProductBoardVO;
import com.park.mall.service.ProductBoardService;

@Controller
public class ProductBoardController {
	@Resource(name="uploadPath")
	    String uploadPath;
	
	@Inject ProductBoardService productBoardService;
	
	
	// 리뷰 게시판 삭제 버튼 클릭시 
	@ResponseBody
	@RequestMapping(value = "/productBoardDel", method= RequestMethod.POST)
	public int productBoardDel(ProductBoardVO productBoardVO,HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO != null) {
		productBoardService.productBoardDel(productBoardVO);
				// 업로드 된 사진이 있을 경우 경로를 지정하고 해당 사진 삭제
				if(productBoardVO.getFileFakeName() != null) {
					File target =	new File(uploadPath,productBoardVO.getFileFakeName());
					target.delete();
				}
		return 0;
		}else {
			return 1;
		}
	}
	
	
//	리뷰 글 저장 클릭 포스트
	@ResponseBody
	@RequestMapping(value = "/insertProductBorad", method= RequestMethod.POST)
	public int insertProductBorad(ProductBoardVO productBoardVO,HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO != null) {
			
			//업로드 사진이 있는지 확인 후 있을 경우 
			if(productBoardVO.getFile() != null) {
				String fileName = productBoardVO.getFile().getOriginalFilename();
				 UUID uuid = UUID.randomUUID();
				   productBoardVO.setFileFakeName(uuid.toString()+ "_" + fileName);
				   productBoardVO.setFileName(fileName);
				   File target = new File(uploadPath, productBoardVO.getFileFakeName());
				
				   
				   if ( ! new File(uploadPath).exists()) {
			            new File(uploadPath).mkdirs();
			        }
				   try {
					    FileCopyUtils.copy(productBoardVO.getFile().getBytes(), target);
					   
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			}
			
			productBoardVO.setProductBoard_name(memberVO.getId());
			productBoardService.insertproductBoard(productBoardVO);
			int n = 0;
			return n;
			
		}
		 int n = 1;
		return n;
		
	}
	
}
