package com.pri.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.multipart.MultipartFile;

import com.pri.shop.dto.CartProductDto;
import com.pri.shop.dto.ProductDto;
import com.pri.shop.dto.ProductInfoDto;
import com.pri.shop.model.ProSearchVO;

public interface ProductService {
	/* 상품 추가 */
	public Boolean insertProduct(ProductInfoDto productInfoDto, MultipartFile file, HttpServletRequest request);
	
	/* 상품수정 */
	public int updateProduct(ProductInfoDto productInfoDto);
	
	/* 상품삭제 */
	public int deleteProduct(String product_no);
	
	/* 상품 옵션 추가 */
	public int insertOpt(ProductDto productDto);
	
	/* 상품 옵션 변경 */
	public int changeOpt(ProductDto productDto);
	
	/* 상품 옵션 삭제 */
	public int deleteOpt(String product_code);
	
	/* 상품의 수량 추가 */
	public int addInventory(ProductDto productDto);
	
	/* 상품의 조회수 증가 */
	public int increaseViews(ProductInfoDto productInfoDto);
	
	/* 상품조회 - 물품번호로 조회 */
	public ProductInfoDto searchProNo(String product_no);
	
	/* 상품조회 (중분류) */
	public ArrayList<ProductInfoDto> searchClass(ProSearchVO proSearchVO);
	
	/* 상품조회 - 중분류 조회 결과의 갯수 */
	public int countOfClass(ProSearchVO proSearchVO);
	
	/* 상품조회 (중분류, 소분류) */
	public ArrayList<ProductInfoDto> searchClass2(ProSearchVO proSearchVO);
	
	/* 상품조회 - 중분류,소분류 조회 결과의 갯수*/
	public int countOfClass2(ProSearchVO proSearchVO);
	
	/* 상품 옵션 조회 */
	public ArrayList<ProductDto> searchOptProNo(String product_no);
	
	/* 상품 옵션조회 - 상품코트로 조회 */
	public ProductDto searchOptCode(String product_code);
	
	/* 상품의 사이즈별 색상 조회 */
	public ArrayList<String> searchOptColor(ProductDto productDto);
	
	/* 상품의 사이즈 조회 */
	public ArrayList<String> searchOptSize(String product_no);
	
	/* 재고량 조회 */
	public int searchOptInventory(ProductDto productDto);
	
	/* 상품코드 조회 */
	public String searchProCode(ProductDto productDto);
	
	/* 최근 상품 조회 */
	public ArrayList<ProductInfoDto> searchLasted();
}
