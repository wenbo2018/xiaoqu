package com.scut.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlUtil {
	public static List<String> getImgSrc(String content) {
		List<String> list = new ArrayList<String>();
		// Ŀǰimg��ǩ��ʾ��3�ֱ��ʽ
		// <img alt="" src="1.jpg"/> <img alt="" src="1.jpg"></img> <img alt=""
		// src="1.jpg">
		// ��ʼƥ��content�е�<img />��ǩ
		Pattern p_img = Pattern.compile("<(img|IMG)(.*?)(/>|></img>|>)");
		Matcher m_img = p_img.matcher(content);
		boolean result_img = m_img.find();
		if (result_img) {
			while (result_img) {
				// ��ȡ��ƥ���<img />��ǩ�е�����
				String str_img = m_img.group(2);
				// ��ʼƥ��<img />��ǩ�е�src
				Pattern p_src = Pattern.compile("(src|SRC)=(\"|\')(.*?)(\"|\')");
				Matcher m_src = p_src.matcher(str_img);
				if (m_src.find()) {
					String str_src = m_src.group(3);
					list.add(str_src);
				}
				// ����ƥ��<img />��ǩ�е�src
				// ƥ��content���Ƿ������һ��<img />��ǩ������������ϲ���ƥ��<img />��ǩ�е�src
				result_img = m_img.find();
			}
		}
		return list;
	}

	public static String filterImg(String src) {
		/*
		 * �滻��<img></img>��<img />����ʽ���ַ���Ϊ���ַ���
		 */
		return src.replaceAll("<img.*>.*</img>", "").replaceAll("<img.*/>", "");
	}
}
