package com.community.config;

public class CommonConfigUCenter {

	public static long TOKEN_EXPIRE_TIME= 3600000;
	public static String USER_IMG_DIR;
	// 鐢ㄦ埛涓績url
	public static String UCENTER_URL;
	public static String CONFIG_DIR;

	public static void init() {

		TOKEN_EXPIRE_TIME = 3600000;
		USER_IMG_DIR = "IdentityUserImgDir";
		UCENTER_URL = "http://localhost:8080/StartpointServer/s";
	}
}
