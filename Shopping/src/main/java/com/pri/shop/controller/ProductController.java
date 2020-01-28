package com.pri.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pri.shop.dto.ProductDto;
import com.pri.shop.dto.ProductInfoDto;
import com.pri.shop.model.PaginationVO;
import com.pri.shop.model.ProSearchVO;
import com.pri.shop.service.ProductService;

/*
	상품 관련 Controller
*/

@Controller
public class ProductController {
	private final ProductService productService;
	
	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	/* 상품추가 페이지로 이동 */
	@RequestMapping(value = "/product/insert", method = RequestMethod.GET)
	public String reqProduct() {
		return "/product/product_insert";
	}
	
	/* 상품옵션 추가 페이지로 이동 */
	@RequestMapping(value = "/product/insertOpt", method = RequestMethod.GET)
	public ModelAndView reqProductOpt(@RequestParam("product_no") String product_no) {
		ModelAndView view = new ModelAndView("/product/product_insertOpt");
		
		ArrayList<ProductDto> plist = productService.searchOptProNo(product_no);
		view.addObject("pList", plist);
		view.addObject("pNo", product_no);
		
		return view;
	}
	
	/* 상품 추가 */
	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	public ModelAndView insert(ProductInfoDto productInfoDto, @RequestParam("photo") MultipartFile file, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		
		productInfoDto.setViews(0);
		productInfoDto.setCell_count(0);
		
		if(productService.insertProduct(productInfoDto, file, request)) {
			view.setViewName("redirect:/product/insertOpt?product_no="+productInfoDto.getProduct_no());
		}else {
			view.setViewName("/error");
		}
		
		return view;
	}
	
	/* 상품 수정 */
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public ModelAndView update(ProductDto productDto) {
		ModelAndView view = new ModelAndView();
		
//		int result = productService.insertOpt(productDto);
//		
//		if(result > 0) {
//			view.setViewName("redirect:/product/insertOpt?product_no="+productDto.getProduct_no());
//		}else {
//			view.setViewName("/error");
//		}
		
		return view;
	}
	
	/* 상품 삭제 */
	@ResponseBody
	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	public Map<String, Object> delete(@RequestParam("product_no") String product_no) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		if(productService.deleteProduct(product_no) > 0) {
			result.put("result", true);
		}
		return result;
	}
	
	
	/* 상품 옵션 추가 */
	@RequestMapping(value = "/product/insertOpt", method = RequestMethod.POST)
	public ModelAndView insertOpt(ProductDto productDto) {
		ModelAndView view = new ModelAndView();
		
		int result = productService.insertOpt(productDto);
		
		if(result > 0) {
			view.setViewName("redirect:/product/insertOpt?product_no="+productDto.getProduct_no());
		}else {
			view.setViewName("/error");
		}
		
		return view;
	}
	
	/* 상품 옵션 변경 */
	@RequestMapping(value = "/product/updateOpt", method = RequestMethod.POST)
	public ModelAndView updateOpt(ProductDto productDto) {
		ModelAndView view = new ModelAndView();
		
		int result = productService.changeOpt(productDto);
		
		if(result > 0) {
			view.setViewName("redirect:/product/insertOpt?product_no="+productDto.getProduct_no());
		}else {
			view.setViewName("/error");
		}
		
		return view;
	}
	
	/* 상품 옵션 삭제 */
	@RequestMapping(value = "/product/deleteOpt", method = RequestMethod.GET)
	public ModelAndView removeOpt(@RequestParam("product_code") String product_code) {
		ModelAndView view = new ModelAndView();
		
		ProductDto dto = productService.searchOptCode(product_code);
		
		int result = productService.deleteOpt(product_code);
		if(result > 0) {
			view.setViewName("redirect:/product/insertOpt?product_no="+dto.getProduct_no());
		}else {
			view.setViewName("/error");	
		}
		
		return view;
	}
	
	/* 상품 옵션의 수량 추가 */
	@RequestMapping(value = "/product/addInven", method = RequestMethod.GET)
	public ModelAndView addInven(@RequestParam("product_code") String product_code,
			@RequestParam("input") int input_cnt) {
		ModelAndView view = new ModelAndView();
		
		ProductDto dto = productService.searchOptCode(product_code);
		dto.setInventory(dto.getInventory() + input_cnt);
		System.out.println(dto.getInventory());
		
		int result = productService.addInventory(dto);
		if(result > 0) {
			view.setViewName("redirect:/product/insertOpt?product_no="+dto.getProduct_no());
		}else {
			view.setViewName("/error");	
		}
		
		return view;
	}
	
	/* 상위 카테고리 조회 */
	@RequestMapping(value = "/product/category", method = RequestMethod.GET)
	public ModelAndView category(@RequestParam(value="class1", required=false) String class1,
									@RequestParam(value="class2", required=false) String class2,
									@RequestParam(value="page", required=false)String page) {
		
		ModelAndView view = new ModelAndView("/product/category");	
		ArrayList<ProductInfoDto> productList;
		
		PaginationVO pageVO;
		
		ProSearchVO vo = new ProSearchVO();
		vo.setClass1(class1);
		
		if(class2 == "") {
			pageVO = new PaginationVO(productService.countOfClass(vo), Integer.parseInt(page));
			vo.setStart(pageVO.getStart());
			vo.setEnd(pageVO.getCntPerPage());
			
			productList = productService.searchClass(vo);
		}else {
			vo.setClass2(class2);
			
			pageVO = new PaginationVO(productService.countOfClass2(vo), Integer.parseInt(page));
			vo.setStart(pageVO.getStart());
			vo.setEnd(pageVO.getCntPerPage());
			
			productList = productService.searchClass2(vo);
			view.addObject("class2", class2);
		}
		
		view.addObject("list", productList);
		view.addObject("paging", pageVO);
		view.addObject("class1", class1);
		
		return view;
	}
	
	/* 상품 상세조회 페이지 */
	@RequestMapping(value = "/product/detail/{product_no}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable String product_no) {
		ModelAndView view = new ModelAndView("/product/detail");
		ProductInfoDto dto = productService.searchProNo(product_no);
		ArrayList<ProductDto> optList = productService.searchOptProNo(product_no);
		
		// 이 방법 외에 optList안의 color와 size를 js로 중복 제거 후 동적으로 화면에 뿌려도 된다. -> DB 접근 최소화
		ArrayList<String> size = productService.searchOptSize(product_no);
		
		int views = dto.getViews();
		dto.setViews(views + 1);
		int result = productService.increaseViews(dto);
		System.out.println(result);
		
		view.addObject("product", dto);
		view.addObject("productOpts", optList);
		view.addObject("size", size);
		
		return view;
	}
	
	/* 상품의 사이즈 별 색상 조회 */
	@ResponseBody
	@RequestMapping(value = "/product/detail/color", method = RequestMethod.POST)
	public Map<String, Object> colorOfSize(ProductDto productDto) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> cnt = new HashMap<String, Object>();
		
		ArrayList<String> color = productService.searchOptColor(productDto);
		cnt.put("color", color);
			
		return cnt;
	}
	
	/* 상품의 재고량 조회 */
	@ResponseBody
	@RequestMapping(value = "/product/detail/inven", method = RequestMethod.POST)
	public Map<String, Object> productInventory(ProductDto productDto) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> cnt = new HashMap<String, Object>();
		
		int inventory = productService.searchOptInventory(productDto); 
		cnt.put("cnt", inventory);
			
		return cnt;
	}
	
}
