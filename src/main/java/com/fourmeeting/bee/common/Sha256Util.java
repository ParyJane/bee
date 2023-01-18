package com.fourmeeting.bee.common;
import java.security.MessageDigest;
import org.springframework.stereotype.Component;

@Component("Sha256Util")
public class Sha256Util {
	public String encryData(String data, String salt) throws Exception {

		// 암호화를 처리할 수 있는 MessageDigest 객체를 생성(java에서 기본 제공)
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");

		String unencryptedData = data + salt;
		// 생성된 MessageDigest 객체를 가지고 데이터를 암호화
		// update 메소드를 사용할 때에는 문자열을 Byte 배열로 변경해서 넘겨주어야 함
		mDigest.update(unencryptedData.getBytes()); // 문자열 데이터를 꺼내서 암호화처리

		byte[] encryptedData = mDigest.digest();

		// 현재 데이터는 10진수로 표기가 되기 떄문에 16진수로 바꾸어 표기하여야 함
		StringBuffer hexString = new StringBuffer();

		for (byte d : encryptedData) {
			// %X : 16진수를 대문자로 표기
			// %x : 16진수를 소문자로 표기
			// %02X : 16진수를 2자리 대문자로 표기
			// ex) ff -> FF / ac -> AC / 3 -> 03
			hexString.append(String.format("%02X", d));
		}
		return hexString.toString();
	}
}
