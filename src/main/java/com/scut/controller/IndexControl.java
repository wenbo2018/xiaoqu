package com.scut.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.scut.model.Campaign;
import com.scut.model.User;
import com.scut.service.ICampaignService;
import com.scut.service.IColumnService;
import com.scut.service.ICommentService;
import com.scut.service.IUserService;
import com.scut.util.MD5Util;
import com.scut.util.StringUtilXiaoQu;

@Controller
public class IndexControl
{    
	 private ICampaignService campaignService;
	 private IUserService userService;
	 private ICommentService commentService;
	 private IColumnService columnService;
 
	 
	public IUserService getUserService() {
		return userService;
	}
	 @Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public ICommentService getCommentService() {
		return commentService;
	}
	@Resource
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	public ICampaignService getCampaignService() 
	 {
		return campaignService;
	 }
    @Resource
	public void setCampaignService(ICampaignService campaignService) 
	{
		this.campaignService = campaignService;
	}
     
	public IColumnService getColumnService() {
		return columnService;
	}
	@Resource
	public void setColumnService(IColumnService columnService) {
		this.columnService = columnService;
	}
	
	 @RequestMapping(value="/",method=RequestMethod.GET)
     public String index(Model model)
     {   
		 
		 
		 
    	 return "index";
     }
	 
	 @RequestMapping(value={" ","/"})    
	 public String index(){    
	         return "index";
	 }  
	 
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
    public String login()
    {
    	return "login";
    }
    
	@RequestMapping(value="/login_admin",method=RequestMethod.GET)
    public String login_admin()
    {
    	return "login_admin";
    }
	
	
    @RequestMapping(value="/register",method=RequestMethod.GET)
    public String register()
    {
    	return "register";
    }
	@RequestMapping(value="show",method=RequestMethod.GET)
    public String show(Model model,int id)
    {   
		List<Campaign> list=campaignService.list("from Campaign where classId=?", new Object[]{id},null);
		model.addAttribute("item-size", list.size());
		System.out.println(list.size());
		model.addAttribute("campaignlist",campaignService.list("from Campaign where classId=?", new Object[]{id},new int[]{1,5}));
		model.addAttribute("classId", id);
   	    return "show";
    }
	
	@ResponseBody
	@RequestMapping(value="show_more",method=RequestMethod.POST)
    public List<Campaign> show(Model model,int classId,int page_sum)
    {   
		List<Campaign> list=new ArrayList<Campaign>();
        list=campaignService.list("from Campaign where classId=? order by time desc", new Object[]{classId},new int[]{page_sum});
   	    return list;
    }
	
	
	
	@RequestMapping(value="main_content",method=RequestMethod.GET)
    public String mainContent(Model model,int id)
    {   
		Campaign campaign=campaignService.load(id);
		model.addAttribute("campaign",campaign);
		//model.addAttribute("comment_list",commentService.list("from Comment where campaign_id=? order by date desc ", new Object[]{campaign.getId()},new int[]{1,5}));
		campaignService.update(id);
   	    return "maincontent";
    }
	

	    @ResponseBody
		@RequestMapping(value="/login",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
		public String login(Model model,String username,String password,HttpServletRequest request)
		{   
			if(userService.login(username,password))
			{   
				HttpSession session = request.getSession();
		        session.setAttribute("session_login_username",username);
		        return StringUtilXiaoQu.isValid;
			}else
			{  
		        return StringUtilXiaoQu.noValid;
			}
		}
	    
	    
	    
	    @ResponseBody
		@RequestMapping(value="click_like",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	    public String click_like(int id)
		{
	    	campaignService.update("update Campaign ca set ca.click_like=click_like+1 where id=?",new Object[]{id});
	    	return "yes";
		}
	    

		    @ResponseBody
			@RequestMapping(value="/login_admin",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
			public Map<String, String> loginAdmin(Model model,String username,String password,HttpServletRequest request)
			{   
				Map<String, String> map=new HashMap<String,String>();
				if(userService.login(username,password))
				{   
					HttpSession session = request.getSession();
			        session.setAttribute("session_login_username",username);
					map.put("isI", "1");
					return map;
				}else
				{  
					map.put("isI", "0");
					return map;
				}
			}
	    

	    @ResponseBody
		@RequestMapping(value="/register",method=RequestMethod.POST)
	    public String register(Model model,String username,String password,
	    		String email,HttpServletRequest request) {   
	    	if(userService.register(username)) {   
	    		User u=new User();
	    		u.setUsername(username);
	    		u.setPassword(MD5Util.encryption(password));
	    		u.setEmail(email);
	    		userService.add(u);
	    		HttpSession session = request.getSession();
		        session.setAttribute("session_login_username",username);
				return StringUtilXiaoQu.isRegisterValid;
	    	}else {   
				return StringUtilXiaoQu.noRegisterValid;
	    	}
	    } 
	
		@RequestMapping(value="/loginout",method=RequestMethod.GET)
	    public String loginOut(HttpServletRequest request) {
			System.out.println("dd");
			HttpSession session = request.getSession();
			session.removeAttribute("session_login_username");
			return "login";  
	    } 
}
