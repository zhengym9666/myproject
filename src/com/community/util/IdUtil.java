package com.community.util;

import java.util.UUID;

public class IdUtil {
	/**
	 * 鑾峰彇uuid
	 * 
	 * @return
	 */
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
}
