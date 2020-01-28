package com.pri.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pri.shop.dto.ProductDto;
import com.pri.shop.dto.ProductInfoDto;
import com.pri.shop.model.ProSearchVO;

public interface ProductDao {
	/* 상품추가 */
	@Insert("INSERT INTO product_info VALUES(#{product_no}, #{class1}, #{class2}, #{product_name}, #{price}, #{views}, #{cell_count}, #{sales}, #{main_photo}, now())")
	public int insert(ProductInfoDto productInfoDto);

	/* 상품수정 */
	@Insert("UPDATE product_info SET class1=#{class1}, class2=#{class2}, product_name=#{product_name}, price=#{price}, cell_count=#{cell_count}, sales=#{sales}, main_photo=#{main_photo}, reg=now() where product_no=#{product_no}")
	public int update(ProductInfoDto productInfoDto);
	
	/* 상품삭제 */
	@Insert("DELETE FROM product_info WHERE product_no=#{product_no}")
	public int delete(String product_no);
	
	/* 상품 옵션 추가 */
	@Insert("INSERT INTO product VALUES(#{product_code}, #{product_no}, #{size}, #{color}, #{inventory})")
	public int insertOpt(ProductDto productDto);
	
	/* 상품 옵션 변경 */
	@Update("UPDATE product SET size=#{size}, color=#{color}, inventory=#{inventory} WHERE product_code=#{product_code}")
	public int updateOpt(ProductDto productDto);
	
	/* 상품 옵션 삭제 */
	@Update("Delete From product WHERE product_code=#{product_code}")
	public int deleteOpt(String product_code);
	
	/* 상품의 수량 추가 */
	@Update("UPDATE product SET inventory=#{inventory} WHERE product_code=#{product_code}")
	public int updateInventory(ProductDto productDto);
	
	/* 상품의 조회수 증가 */
	@Update("UPDATE product_info SET views=#{views} WHERE product_no=#{product_no}")
	public int updateViews(ProductInfoDto productInfoDto);
	
	/* 상품조회 - 물품번호로 조회 */
	@Select("SELECT * FROM product_info WHERE product_no=#{product_no}")
	public ProductInfoDto selectOfProNo(String product_no);
	
	/* 상품조회 - 중분류로 조회 */
	@Select("SELECT * FROM product_info WHERE class1=#{class1} ORDER BY views DESC, product_no ASC limit #{start}, #{end}")
	public ArrayList<ProductInfoDto> selectOfClass(ProSearchVO proSearchVO);
	
	/* 상품조회 - 중분류 조회 결과의 갯수 */
	@Select("SELECT count(*) FROM product_info WHERE class1=#{class1}")
	public int countOfClass(ProSearchVO proSearchVO);
	
	/* 상품조회 - 중분류,소분류로 조회 */
	@Select("SELECT * FROM product_info WHERE class1=#{class1} AND class2=#{class2} ORDER BY views DESC, product_no ASC limit #{start}, #{end}")
	public ArrayList<ProductInfoDto> selectOfClass2(ProSearchVO proSearchVO);
	
	/* 상품조회 - 중분류,소분류 조회 결과의 갯수*/
	@Select("SELECT count(*) FROM product_info WHERE class1=#{class1} AND class2=#{class2}")
	public int countOfClass2(ProSearchVO proSearchVO);
	
	/* 상품 옵션조회 - 상품번호로 조회 */
	@Select("SELECT * FROM product WHERE product_no=#{product_no}")
	public ArrayList<ProductDto> selectDetail(String product_no);
	
	/* 상품 옵션조회 - 상품코트로 조회 */
	@Select("SELECT * FROM product WHERE product_code=#{product_code}")
	public ProductDto selectDetailOfCode(String product_code);
	
	/* 상품의 사이즈별 색상 조회 */
	@Select("SELECT color FROM product WHERE product_no=#{product_no} AND size=#{size} GROUP BY color")
	public ArrayList<String> selectColorOfSize(ProductDto productDto);
	
	/* 상품의 사이즈 조회 */
	@Select("SELECT size FROM product WHERE product_no=#{product_no} GROUP BY size")
	public ArrayList<String> selectSize(String product_no);
	
	/* 재고량 조회 */
	@Select("SELECT inventory FROM product WHERE product_no=#{product_no} AND size=#{size} AND color=#{color}")
	public int selectInven(ProductDto ProductDto);
	
	/* 상품코드 조회 */
	@Select("SELECT product_code FROM product WHERE product_no=#{product_no} AND size=#{size} AND color=#{color}")
	public String selectProductCode(ProductDto ProductDto);
	
	/* 최근 상품 조회 */
	@Select("SELECT * FROM product_info ORDER BY reg, product_no ASC limit 10")
	public ArrayList<ProductInfoDto> selectLasted();
}
