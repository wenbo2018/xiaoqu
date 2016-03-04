package com.scut.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scut.model.Campaign;
import com.scut.model.Comment;
import com.scut.model.Question;
import com.scut.model.User;
import com.scut.service.CommentService;
import com.scut.service.ICampaignService;
import com.scut.service.ICommentService;
import com.scut.service.IQuestionService;
import com.scut.service.IUserService;
import com.scut.util.MD5Util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserControl
{
	

	
    private IUserService userService;
    private IQuestionService questionService;
    private ICommentService commentService;
    private ICampaignService campaignService;
    
    
	public ICampaignService getCampaignService() {
		return campaignService;
	}
	@Resource
	public void setCampaignService(ICampaignService campaignService) {
		this.campaignService = campaignService;
	}
	public IUserService getUserService() {
		return userService;
	}
	public ICommentService getCommentService() {
		return commentService;
	}
	@Resource
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public IQuestionService getQuestionService() {
		return questionService;
	}
	@Resource
	public void setQuestionService(IQuestionService questionService) {
		this.questionService = questionService;
	}
	
    @RequestMapping(value="/index",method=RequestMethod.GET)
    public String index(Model model,HttpServletRequest request)
    {
    	System.out.println("ddddddd");
    	model.addAttribute("user", userService.load("from User where username=?", new Object[]{(String) request.getSession().getAttribute("session_login_username")}));
    	return "user/index";
    }
    
    
    @RequestMapping(value="/setting",method=RequestMethod.GET)
    public String set(Model model,HttpServletRequest request)
    {   
    	model.addAttribute("user", userService.load("from User where username=?", new Object[]{(String) request.getSession().getAttribute("session_login_username")}));
    	return "user/setting";
    }
    
    @RequestMapping(value="/accountSet",method=RequestMethod.GET)
    public String accountSet(Model model,HttpServletRequest request)
    {   
    	model.addAttribute("user", userService.load("from User where username=?", new Object[]{(String) request.getSession().getAttribute("session_login_username")}));
    	return "user/account_set";
    }
    
    
    @ResponseBody
    @RequestMapping(value="/updateUser",method=RequestMethod.POST)
    public Map<String, String> updateUser(Model model,String nickname,String email,HttpServletRequest request)
    {   
    	int id=userService.load("from User where username=?", new Object[]{(String)request.getSession().getAttribute("session_login_username")}).getId();
    	userService.update("update User u set u.nickname=? , u.email=? where id=?", new Object[]{nickname,email,id});
    	Map<String, String> map=new HashMap<String,String>();
    	map.put("isI", "1");
		return map;
    }
    
    
	
	
	@ResponseBody
	@RequestMapping(value="update_picture",method=RequestMethod.POST)
	public void updatePicture(MultipartFile userPicture,HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		String userPictureName=userPicture.getOriginalFilename();
		String userPicMd5=MD5Util.encryption(userPicture.getOriginalFilename())+"."+userPictureName.substring(userPictureName.lastIndexOf(".")+1);
		String realPath=request.getSession().getServletContext().getRealPath("resource/img/user");
		System.out.println(realPath);
		File file=new File(realPath+"/"+userPicMd5);
		FileUtils.copyInputStreamToFile(userPicture.getInputStream(), file);
		int id=userService.load("from User where username=?", new Object[]{(String)request.getSession().getAttribute("session_login_username")}).getId();
    	userService.update("update User u set u.profile=? where id=?", new Object[]{userPicMd5,id});
    	String picUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/resource/img/user/"+userPicMd5;
    	PrintWriter writer = response.getWriter();
		writer.print("{");
		writer.print("msg:\"�ļ���С:"+userPicture.getSize()+",�ļ���:"+userPicture.getOriginalFilename()+"\"");
		writer.print(",picUrl:\"" + picUrl + "\"");
		writer.print("}");
		writer.close();
    	
	}
    
	@RequestMapping(value="myQuestion",method=RequestMethod.GET)
	public String myQuestion(HttpServletRequest request,Model model)
	{
		User user=userService.load("from User where username=?",new Object[]{request.getSession().getAttribute("session_login_username")} );
		
		List<Question> list= questionService.lists("from Question where user_id=?",new Object[]{user.getId()}, null);
		
		model.addAttribute("question", list);
        
		return "user/myquestion";
	}
	@ResponseBody
	@RequestMapping(value="getReply",method=RequestMethod.POST)
	public String getReply(HttpServletRequest request)
	{
		User user=userService.load("from User where username=?",new Object[]{request.getSession().getAttribute("session_login_username")} );
		List<Comment> list=commentService.list("from Comment where user_id=? and isRead=?", new Object[]{user.getId(),0}, null);
		JSONArray jsonArray=new JSONArray();
		for(Comment q:list)
		{
			JSONObject js=new JSONObject();
			js.put("nickname",q.getUser().getNickname());
			js.put("date", q.getDate());
			js.put("id", q.getQuestion().getId());
			js.put("title", q.getQuestion().getTitle());
			jsonArray.add(js);
		}
		return jsonArray.toString();
	}
	@RequestMapping(value="showReply",method=RequestMethod.GET)
	public String showReply(int id)
	{   
		commentService.update("update Comment c set c.isRead=? where question_id=?", new Object[]{1,id});
		return "redirect:/question/show?id="+id;
	}
	@RequestMapping(value="dynamic",method=RequestMethod.GET)
	public String dynamic(Model model)
	{
		List<Campaign> list=new ArrayList<Campaign>();
        list=campaignService.list("from Campaign", null, new int[]{1,10});
        model.addAttribute("campaign", list);
        return "user/dymac";
	}
}
