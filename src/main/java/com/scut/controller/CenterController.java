package com.scut.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scut.model.Campaign;
import com.scut.model.Column;
import com.scut.model.Question;
import com.scut.model.User;
import com.scut.service.ICampaignService;
import com.scut.service.IColumnService;
import com.scut.service.IQuestionService;
import com.scut.service.IUserService;
import com.scut.service.QuestionService;
import com.scut.util.HtmlUtil;
import com.scut.util.MD5Util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/center")
public class CenterController {

	private ICampaignService campaignService;
	private IColumnService columnService;
	private IUserService userService;

	public ICampaignService getCampaignService() {
		return campaignService;
	}

	@Resource
	public void setCampaignService(ICampaignService campaignService) {
		this.campaignService = campaignService;
	}

	public IColumnService getColumnService() {
		return columnService;
	}

	@Resource
	public void setColumnService(IColumnService columnService) {
		this.columnService = columnService;
	}

	public IUserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		System.out.println("ddddd");
		return "center/index";
	}

	@RequestMapping(value = "123", method = RequestMethod.GET)
	public String index1() {
		return "center/successAdd";
	}

	@ResponseBody
	@RequestMapping(value = "campaign_add", method = RequestMethod.POST)
	public String campaignAdd(Model model, Campaign campaign) {
		campaign.setTime(new Date(new java.util.Date().getTime()));
		List<String> src = HtmlUtil.getImgSrc(campaign.getContent());
		if (src.size() > 0)
			campaign.setUrlTitle(src.get(0));
		campaignService.add(campaign);
		return "yes";
	}

	@ResponseBody
	@RequestMapping(value = "list_select", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String listSelect(int id) {
		List<Campaign> list = new ArrayList<Campaign>();
		List<Campaign> size = new ArrayList<Campaign>();
		int count = 0;// 锟斤拷取锟斤拷锟斤拷锟斤拷
		if (id != 0) {
			size = campaignService.list("from Campaign where classId=?", new Object[] { id }, null);
			count = size.size();
			System.out.println(count);
			list = campaignService.list("from Campaign where classId=?", new Object[] { id },
					new int[] { 0, (count > 10) ? 9 : size.size() });

		} else {
			list = campaignService.list("from Campaign", null, new int[] { 0, 9 });
			size = campaignService.list("from Campaign", null, null);
			count = size.size();
		}

		JSONArray jsonArray = new JSONArray();
		for (Campaign c : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", c.getId());
			jsonObject.put("title", c.getTitle());
			switch (c.getClassId()) {
			case 1:
				jsonObject.put("classId", "阅读");
				break;
			case 2:
				jsonObject.put("classId", "音乐");
				break;
			case 3:
				jsonObject.put("classId", "视频");
				break;
			case 4:
				jsonObject.put("classId", "科技");
				break;
			case 5:
				jsonObject.put("classId", "游戏");
				break;
			case 6:
				jsonObject.put("classId", "专辑");
				break;
			case 7:
				jsonObject.put("classId", "旅行");
				break;
			case 8:
				jsonObject.put("classId", "创业");
				break;
			}
			if (c.getState() == 0)
				jsonObject.put("state", "未审核");
			else
				jsonObject.put("state", "已审核");
			jsonObject.put("time", c.getTime().toString());
			jsonObject.put("count", count);
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "list_search", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String listSearch(String keyword) {
		List<Campaign> list = new ArrayList<Campaign>();
		list = campaignService.list("from Campaign where title like ?", new Object[] { "%" + keyword + "%" },
				new int[] { 1, 10 });
		int count = list.size();// 锟斤拷取锟斤拷锟斤拷锟斤拷
		JSONArray jsonArray = new JSONArray();
		for (Campaign c : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", c.getId());
			jsonObject.put("title", c.getTitle());
			switch (c.getClassId()) {
			case 1:
				jsonObject.put("classId", "阅读");
				break;
			case 2:
				jsonObject.put("classId", "音乐");
				break;
			case 3:
				jsonObject.put("classId", "视频");
				break;
			case 4:
				jsonObject.put("classId", "科技");
				break;
			case 5:
				jsonObject.put("classId", "游戏");
				break;
			case 6:
				jsonObject.put("classId", "专辑");
				break;
			case 7:
				jsonObject.put("classId", "旅行");
				break;
			case 8:
				jsonObject.put("classId", "创业");
			}
			if (c.getState() == 0)
				jsonObject.put("state", "未审核");
			else
				jsonObject.put("state", "已审核");
			jsonObject.put("time", c.getTime().toString());
			jsonObject.put("count", count);
			jsonArray.add(jsonObject);
		}

		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String list() {
		List<Campaign> temp = campaignService.list("from Campaign order by time desc", null, null);
		int count = temp.size();// 锟斤拷取锟斤拷锟斤拷锟斤拷
		List<Campaign> list = new ArrayList<Campaign>();
		list = campaignService.list("from Campaign", null, new int[] { 0, 9 });
		JSONArray jsonArray = new JSONArray();
		for (Campaign c : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", c.getId());
			jsonObject.put("title", c.getTitle());
			switch (c.getClassId()) {
			case 1:
				jsonObject.put("classId", "阅读");
				break;
			case 2:
				jsonObject.put("classId", "音乐");
				break;
			case 3:
				jsonObject.put("classId", "视频");
				break;
			case 4:
				jsonObject.put("classId", "科技");
				break;
			case 5:
				jsonObject.put("classId", "游戏");
				break;
			case 6:
				jsonObject.put("classId", "专辑");
				break;
			case 7:
				jsonObject.put("classId", "旅行");
				break;
			case 8:
				jsonObject.put("classId", "创业");
			}
			if (c.getState() == 0)
				jsonObject.put("state", "未审核");
			else
				jsonObject.put("state", "已审核");
			jsonObject.put("time", c.getTime().toString());
			jsonObject.put("count", count);
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "page_list", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String pageList(int curPage, int id, String keyword) {
		System.out.println(curPage);
		int first = (curPage - 1) * 10 + 1;
		int end = 10;
		List<Campaign> list = new ArrayList<Campaign>();
		if (keyword == null || keyword.equals("") && id == 0)
			list = campaignService.list("from Campaign order by time desc", null, new int[] { first, end });
		else if (keyword == null || keyword.equals("") && id != 0)
			list = campaignService.list("from Campaign where classId=? order by time desc", new Object[] { id },
					new int[] { first, end });
		else
			list = campaignService.list("from Campaign where  title like ? order by time desc",
					new Object[] { "%" + keyword + "%" }, new int[] { first, end });
		return setCampaignData(list);
	}

	private String setCampaignData(List<Campaign> list) {
		JSONArray jsonArray = new JSONArray();
		for (Campaign c : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", c.getId());
			jsonObject.put("title", c.getTitle());
			switch (c.getClassId()) {
			case 1:
				jsonObject.put("classId", "阅读");
				break;
			case 2:
				jsonObject.put("classId", "音乐");
				break;
			case 3:
				jsonObject.put("classId", "视频");
				break;
			case 4:
				jsonObject.put("classId", "科技");
				break;
			case 5:
				jsonObject.put("classId", "游戏");
				break;
			case 6:
				jsonObject.put("classId", "专辑");
				break;
			case 7:
				jsonObject.put("classId", "旅行");
				break;
			case 8:
				jsonObject.put("classId", "创业");
			}
			if (c.getState() == 0)
				jsonObject.put("state", "未审核");
			else
				jsonObject.put("state", "已审核");
			jsonObject.put("time", c.getTime().toString());
			jsonArray.add(jsonObject);
		}

		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "list_verify", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String listVer() {
		List<Campaign> temp = campaignService.list("from Campaign order by time desc", null, null);
		int count = temp.size();// 锟斤拷取锟斤拷锟斤拷锟斤拷
		List<Campaign> list = new ArrayList<Campaign>();
		list = campaignService.list("from Campaign where state=?", new Object[] { 0 }, new int[] { 1, 10 });
		System.out.println(list.size());
		JSONArray jsonArray = new JSONArray();
		for (Campaign c : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", c.getId());
			jsonObject.put("title", c.getTitle());
			switch (c.getClassId()) {
			case 1:
				jsonObject.put("classId", "阅读");
				break;
			case 2:
				jsonObject.put("classId", "音乐");
				break;
			case 3:
				jsonObject.put("classId", "视频");
				break;
			case 4:
				jsonObject.put("classId", "科技");
				break;
			case 5:
				jsonObject.put("classId", "游戏");
				break;
			case 6:
				jsonObject.put("classId", "专辑");
				break;
			case 7:
				jsonObject.put("classId", "旅行");
				break;
			case 8:
				jsonObject.put("classId", "创业");
			}
			jsonObject.put("state", "未审核");
			jsonObject.put("time", c.getTime().toString());
			jsonObject.put("count", count);
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "page_list_verify", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String pageListVer(int curPage, int id, String keyword) {
		int first = (curPage - 1) * 10 + 1;
		int end = 10;
		List<Campaign> list = new ArrayList<Campaign>();
		if (keyword == null || keyword.equals("") && id == 0)
			list = campaignService.list("from Campaign where state=? order by time desc", new Object[] { 0 },
					new int[] { first, end });
		else if (keyword == null || keyword.equals("") && id != 0)
			list = campaignService.list("from Campaign where classId=? order by time desc", new Object[] { id },
					new int[] { first, end });
		else
			list = campaignService.list("from Campaign where  title like ? order by time desc",
					new Object[] { "%" + keyword + "%" }, new int[] { first, end });
		return setCampaignData(list);
	}

	@ResponseBody
	@RequestMapping(value = "campaign_delete", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String delete(int campaignId) {
		campaignService.delete(campaignId);
		return "yes";
	}

	/****************************************************************************************************************************************************/

	@RequestMapping(value = "userIndex", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String userIndex() {
		return "center/user";
	}

	@ResponseBody
	@RequestMapping(value = "user_list", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getShopInJSON(Model model, String username) {

		List<User> temp = userService.lists("from User", null, null);
		int count = temp.size();// 锟斤拷取锟斤拷锟斤拷锟斤拷
		List<User> list = new ArrayList<User>();
		list = userService.lists("from User", null, new int[] { 1, 10 });
		JSONArray jsonArray = new JSONArray();
		for (User user : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", user.getId());
			jsonObject.put("username", user.getUsername());
			jsonObject.put("nickname", user.getNickname());
			if (user.getUserClass() == 0)
				jsonObject.put("userClass", "普通用户");
			else
				jsonObject.put("userClass", "管理员");
			jsonObject.put("email", user.getEmail());
			if (user.getSexClass() == 0)
				jsonObject.put("sexClass", "男");
			else
				jsonObject.put("sexClass", "女");
			jsonArray.add(jsonObject);
			jsonObject.put("count", count);
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "userPageList", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String userPageList(int curPage, String keyword) {
		int first = (curPage - 1) * 10 + 1;
		int end = 10;
		List<User> list = new ArrayList<User>();
		if (keyword == null || keyword.equals(""))
			list = userService.lists("from User", null, new int[] { first, end });
		else
			list = userService.lists("from User where  nickname like ?", new Object[] { "%" + keyword + "%" },
					new int[] { first, end });
		JSONArray jsonArray = new JSONArray();
		for (User user : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", user.getId());
			jsonObject.put("username", user.getUsername());
			jsonObject.put("nickname", user.getNickname());
			if (user.getUserClass() == 0)
				jsonObject.put("userClass", "普通用户");
			else
				jsonObject.put("userClass", "管理员");
			jsonObject.put("email", user.getEmail());
			if (user.getSexClass() == 0)
				jsonObject.put("sexClass", "男");
			else
				jsonObject.put("sexClass", "女");
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}
	/****************************************************************************************************************************************************/

	/****************************************************************************************************************************************************/
	@RequestMapping(value = "questionIndex", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String questionIndex() {
		return "center/question";
	}

	@ResponseBody
	@RequestMapping(value = "question_list", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String questionList(Model model, String username) {

		List<Question> temp = questionService.lists("from Question", null, null);
		int count = temp.size();// 锟斤拷取锟斤拷锟斤拷锟斤拷
		List<Question> list = new ArrayList<Question>();
		list = questionService.lists("from Question", null, new int[] { 1, 10 });
		JSONArray jsonArray = new JSONArray();
		for (Question q : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", q.getId());
			jsonObject.put("title", q.getTitle());
			jsonObject.put("clickTimes", q.getClickTimes());
			jsonObject.put("count", count);
			jsonObject.put("user", q.getUser().getNickname());
			jsonObject.put("countComment", q.getContent().length());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "questionPageList", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String questionPageList(int curPage, String keyword) {
		int first = (curPage - 1) * 10 + 1;
		int end = 10;
		List<Question> list = new ArrayList<Question>();
		if (keyword == null || keyword.equals(""))
			list = questionService.lists("from Question", null, new int[] { first, end });
		else
			list = questionService.lists("from User where  nickname like ?", new Object[] { "%" + keyword + "%" },
					new int[] { first, end });
		JSONArray jsonArray = new JSONArray();
		for (Question q : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", q.getId());
			jsonObject.put("title", q.getTitle());
			jsonObject.put("clickTimes", q.getClickTimes());
			jsonObject.put("user", q.getUser().getNickname());
			jsonObject.put("countComment", q.getContent().length());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	/****************************************************************************************************************************************************/

	@ResponseBody
	@RequestMapping(value = "column_list", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public List<Column> getColumn_list() {
		List<Column> list = new ArrayList<Column>();
		list = columnService.list();
		return list;
	}

	private IQuestionService questionService;

	public IQuestionService getQuestionService() {
		return questionService;
	}

	@Resource
	public void setQuestionService(IQuestionService questionService) {
		this.questionService = questionService;
	}

	@ResponseBody
	@RequestMapping(value = "ImgUpload", method = RequestMethod.POST)
	public void ImgUpload(MultipartFile userPicture, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String userPictureName = userPicture.getOriginalFilename();
		String userPicMd5 = MD5Util.encryption(userPicture.getOriginalFilename()) + "."
				+ userPictureName.substring(userPictureName.lastIndexOf(".") + 1);
		String realPath = request.getSession().getServletContext().getRealPath("resource/img/question");
		System.out.println(realPath);
		File file = new File(realPath + "/" + userPicMd5);
		FileUtils.copyInputStreamToFile(userPicture.getInputStream(), file);
		String picUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath() + "/resource/img/user/" + userPicMd5;
		System.out.println(picUrl);
		PrintWriter writer = response.getWriter();
		writer.print("{");
		writer.print("success:true" + "," + "msg:error mesg");
		writer.print("file_path:\"" + picUrl + "\"");
		writer.print("}");
		writer.close();
	}
}
