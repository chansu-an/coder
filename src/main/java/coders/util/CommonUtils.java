package coders.util;

import java.util.UUID;

public class CommonUtils {

	public static String getRamdomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
