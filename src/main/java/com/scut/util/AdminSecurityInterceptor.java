package com.scut.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.scut.service.IUserService;

public class AdminSecurityInterceptor implements HandlerInterceptor
{
	private IUserService userService;

	public IUserService getUserService()
	{
		return userService;
	}

	@Resource
	public void setUserService(IUserService userService)
	{
		this.userService = userService;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception
	{

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception
	{

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception
	{

		/*
		 * HttpSession session = request.getSession();
		 * 
		 * String user = (String)
		 * session.getAttribute("session_login_username");
		 * //������Ը��session���û����жϽ�ɫ��Ȩ�ޣ����Ȩ�����ض���ͬ��ҳ�棬���������ֻ������һ���ض��� if
		 * (StringUtils.isEmpty(user)) { response.sendRedirect("/scut/login");
		 * return false; } //�ж��Ƿ�Ϊ����Ա�û�,�ǹ���Ա�û����ܽ�ȥ��������뵽����Ա��¼����
		 * if(userService.load("from User where username= ?", new
		 * Object[]{request.getSession().getAttribute("session_login_username")}
		 * ).getUserClass()==0) { response.sendRedirect("/scut/login_admin");
		 * return false; }
		 */
		return true;
	}

}
