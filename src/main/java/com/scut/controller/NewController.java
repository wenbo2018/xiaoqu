package com.scut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scut.model.Campaign;
import com.scut.service.ICampaignService;
import com.scut.service.IColumnService;
import com.scut.service.ICommentService;
import com.scut.service.IUserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/news")
public class NewController
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
	
	
	@RequestMapping(value="/theme/{id}",method=RequestMethod.GET)
    public String show(Model model,@PathVariable int id)
    {   
		List<Campaign> list=campaignService.list("from Campaign where classId=?", new Object[]{id},null);
		model.addAttribute("campaignlist",campaignService.list("from Campaign where classId=?", new Object[]{id},new int[]{0,10}));
		model.addAttribute("classId", id);
		model.addAttribute("itemsize", list.size());
   	    return "news/show";
    }
	
	@ResponseBody
	@RequestMapping(value="/test",method=RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String show1()
    {   
		List<Campaign> list=campaignService.list("from Campaign where classId=?", new Object[]{1},null);

		JSONArray jsonArray=new JSONArray();
		
		for(Campaign campaign:list) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("title",campaign.getTitle());
			jsonObject.put("time",campaign.getTime().toString());
			jsonObject.put("url",campaign.getUrlTitle());
			jsonArray.add(jsonObject);
		}
   	    return jsonArray.toString();
    }
	
	
	@ResponseBody
	@RequestMapping(value="show_more",method=RequestMethod.POST)
    public List<Campaign> show(Model model,int classId,int page_sum)
    {   
		List<Campaign> list=new ArrayList<Campaign>();
        list=campaignService.list("from Campaign where classId=? order by time desc", new Object[]{classId},new int[]{page_sum});
   	    return list;
    }
	@RequestMapping(value="/content/{id}",method=RequestMethod.GET)
    public String mainContent(Model model,@PathVariable int id)
    {   
		Campaign campaign=campaignService.load(id);
		model.addAttribute("campaign",campaign);
		campaignService.update(id);
   	    return "news/maincontent";
    }
	
	
	
}
