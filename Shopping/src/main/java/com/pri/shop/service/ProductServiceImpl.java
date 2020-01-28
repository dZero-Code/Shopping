package com.pri.shop.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pri.shop.dao.ProductDao;
import com.pri.shop.dto.CartProductDto;
import com.pri.shop.dto.ProductDto;
import com.pri.shop.dto.ProductInfoDto;
import com.pri.shop.model.ProSearchVO;
import com.pri.shop.utils.UploadFileUtils;

@Service
public class ProductServiceImpl implements ProductService{
	private final ProductDao productDao; 
	
	@Autowired
	public ProductServiceImpl(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	/* 상품 추가 */
	@Override
	public Boolean insertProduct(ProductInfoDto productInfoDto, MultipartFile file, HttpServletRequest request) {
		final String PATH = "C:"+File.separator+"dev"+File.separator+"Java"+File.separator+"resources";
		
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			//Long size = file.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = UploadFileUtils.getSaveFileName(extName);
			
			String filePath = PATH + File.separator + "img" + File.separator + "product" + File.separator + productInfoDto.getClass1();
			
			System.out.println(filePath);
			
			File f = new File(filePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(filePath + File.separator + saveFileName);
			fos.write(data);
			fos.close();
			
			productInfoDto.setMain_photo(saveFileName);
			
			int result = productDao.insert(productInfoDto);
			if(result > 0) return true;
		}
		catch (IOException e) {
			System.err.println("err");
		}
		
		return false;
	}
	
	/* 상품수정 */
	public int updateProduct(ProductInfoDto productInfoDto) {
		return productDao.update(productInfoDto);
	}
	
	/* 상품삭제 */
	public int deleteProduct(String product_no) {
		return productDao.delete(product_no);
	}
	
	
	/* 상품 옵션 추가*/
	@Override
	public int insertOpt(ProductDto productDto) {
		return productDao.insertOpt(productDto);
	}
	
	/* 상품 옵션 변경 */
	@Override
	public int changeOpt(ProductDto productDto) {
		return productDao.updateOpt(productDto);
	}
	
	/* 상품 옵션 삭제 */
	@Override
	public int deleteOpt(String product_code) {
		return productDao.deleteOpt(product_code);
	}
	
	/* 상품의 수량 추가 */
	@Override
	public int addInventory(ProductDto productDto) {
		return productDao.updateInventory(productDto);
	}
	
	/* 상품의 조회수 증가 */
	@Override
	public int increaseViews(ProductInfoDto productInfoDto) {
		return productDao.updateViews(productInfoDto);
	}
	
	/* 상품 조회 (상품번호) */
	@Override
	public ProductInfoDto searchProNo(String product_no) {
		return productDao.selectOfProNo(product_no);
	}
	
	/* 상품조회 (중분류) */
	@Override
	public ArrayList<ProductInfoDto> searchClass(ProSearchVO proSearchVO) {
		return productDao.selectOfClass(proSearchVO);
	}

	/* 상품조회 (중분류)의 전체갯수 */
	@Override
	public int countOfClass(ProSearchVO proSearchVO) {
		return productDao.countOfClass(proSearchVO);
	}
	
	/* 상품조회 (중분류, 소분류) */
	@Override
	public ArrayList<ProductInfoDto> searchClass2(ProSearchVO proSearchVO) {
		return productDao.selectOfClass2(proSearchVO);
	}	
	
	/* 상품조회 (중분류, 소분류)의 전체갯수 */
	@Override
	public int countOfClass2(ProSearchVO proSearchVO) {
		return productDao.countOfClass2(proSearchVO);
	}
	
	/* 상품 상세조회 */
	@Override
	public ArrayList<ProductDto> searchOptProNo(String product_no) {
		return productDao.selectDetail(product_no);
	}
	
	/* 상품 옵션조회 - 상품코트로 조회 */
	@Override
	public ProductDto searchOptCode(String product_code) {
		return productDao.selectDetailOfCode(product_code);
	}
	
	/* 상품 색상 조회 */
	public ArrayList<String> searchOptColor(ProductDto productDto){
		return productDao.selectColorOfSize(productDto);
	}
	
	/* 상품 사이즈 조회 */
	public ArrayList<String> searchOptSize(String product_no){
		return productDao.selectSize(product_no);
	}
	
	/* 상품 재고량 조회 */
	public int searchOptInventory(ProductDto productDto) {
		return productDao.selectInven(productDto);
	}
	
	/* 상품 코드번호 조회 */
	public String searchProCode(ProductDto productDto) {
		return productDao.selectProductCode(productDto);
	}
	
	/* 최근 상품 조회 */
	public ArrayList<ProductInfoDto> searchLasted(){
		return productDao.selectLasted();
	}
}
