
package com.community.util;

import com.community.service.impl.TokenServiceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

public class TimeUtils {
	public static SimpleDateFormat longDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat shortDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static Logger log=Logger.getLogger(TimeUtils.class.toString());
	public static String dateToString(Date date) {
		if (date == null) {
			return null;
		}
		return longDateFormat.format(date);
	}

	public static Date stringToDateDay(String time) {
		if (StringUtil.stringIsNull(time)) {
			return null;
		}
		Date date;
		try {
			date = shortDateFormat.parse(time);
			return date;
		} catch (ParseException e) {
			log.info("TimeUtils.stringToDateDay error"+ e);
			return null;
		}

	}
}
