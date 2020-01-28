package com.pri.shop.utils;

import java.util.Calendar;

public class UploadFileUtils {
	private static UploadFileUtils file;
		
	private UploadFileUtils() {}
	
	public static UploadFileUtils getFormat() {
		if(file == null) {
			file = new UploadFileUtils();
		}
		return file;
	}
		
	// 현재 시간을 기준으로 파일 이름 생성
	public static String getSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
}