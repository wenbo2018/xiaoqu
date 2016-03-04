package com.scut.util;

import java.security.MessageDigest;

/**
 * TODO<MD5���ܹ�����>
 * 
 * @author ���Ĳ�
 * @data: 2015��8��29�� ����7:49:58
 * @version: V1.0
 */
public class MD5Util
{

	/**
	 * @Title: encryption @Description: TODO<MD5�����㷨> @param @param
	 * ��Ҫ���ܵ��ַ� @param @return ���ܺ���ַ� @return String @throws
	 */
	public static String encryption(String s)
	{
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		try
		{
			byte[] btInput = s.getBytes();
			// ���MD5ժҪ�㷨�� MessageDigest ����
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// ʹ��ָ�����ֽڸ���ժҪ
			mdInst.update(btInput);
			// �������
			byte[] md = mdInst.digest();
			// ������ת����ʮ����Ƶ��ַ���ʽ
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++)
			{
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
