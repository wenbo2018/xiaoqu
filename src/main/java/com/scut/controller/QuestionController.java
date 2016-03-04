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
import javax.persistence.criteria.From;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scut.model.Comment;
import com.scut.model.Question;
import com.scut.model.QuestionAttention;
import com.scut.model.QuestionLike;
import com.scut.model.User;
import com.scut.service.ICommentService;
import com.scut.service.IQuestionAttebtionService;
import com.scut.service.IQuestionLikeService;
import com.scut.service.IQuestionService;
import com.scut.service.IUserService;
import com.scut.util.MD5Util;
import com.scut.util.StringUtilXiaoQu;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/question_square")
public class QuestionController 
{
	
	private  IQuestionService questionService;
	private IUserService userService;
    private ICommentService commentService;
    private IQuestionAttebtionService questionAttebtionService;
    private IQuestionLikeService questionLikeService;
    public IQuestionService getQuestionService() {
		return questionService;
	}
    @Resource
	public void setQuestionService(IQuestionService questionService) {
		this.questionService = questionService;
	}
    
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
	

	public IQuestionAttebtionService getQuestionAttebtionService()
	{
		return questionAttebtionService;
	}
	@Resource
	public void setQuestionAttebtionService(IQuestionAttebtionService questionAttebtionService)
	{
		this.questionAttebtionService = questionAttebtionService;
		
	}
	
	public IQuestionLikeService getQuestionLikeService() {
		return questionLikeService;
	}
	 @Resource
	public void setQuestionLikeService(IQuestionLikeService questionLikeService) {
		this.questionLikeService = questionLikeService;
	}
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	 public String index(Model model)
	 {
		 model.addAttribute("question", questionService.lists("from Question  order by date desc",null, new int[]{0,10}));
		 model.addAttribute("recoProblem", questionService.lists("from Question order by clickTimes desc", null, new int[]{0,10}));
		 /*model.addAttribute("topProblem", questionService.lists("from Question order by comments.size() desc", null, new int[]{0,9}));*/
		 List<Question> list=questionService.lists("from Question", null, null);
		 model.addAttribute("itemsize", list.size());
		 return "question_square/index";
	 }
	
	@RequestMapping(value={"life"},method=RequestMethod.GET)
	public String life(Model model) {
		 model.addAttribute("question", questionService.lists("from Question where question_Id=? order by date desc",new Object[]{1}, new int[]{0,10}));
		 model.addAttribute("recoProblem", questionService.lists("from Question order by clickTimes desc", null, new int[]{0,10}));
		 List<Question> list=questionService.lists("from Question where question_Id=?",new Object[]{1}, null);
		 model.addAttribute("itemsize", list.size());
		 return "question_square/life";
	}
	
	@RequestMapping(value={"lost_and_find"},method=RequestMethod.GET)
	public String lost_and_find(Model model) {
		 model.addAttribute("question", questionService.lists("from Question where question_Id=? order by date desc",new Object[]{2}, new int[]{0,10}));
		 model.addAttribute("recoProblem", questionService.lists("from Question order by clickTimes desc", null, new int[]{0,10}));
		 List<Question> list=questionService.lists("from Question where question_Id=?",new Object[]{2}, null);
		 model.addAttribute("itemsize", list.size());
		 return "question_square/lost_and_find";
	}
	
	
	@RequestMapping(value={"ask_for_exam"},method=RequestMethod.GET)
	public String ask_for_exam(Model model) {
		 model.addAttribute("question", questionService.lists("from Question where question_Id=? order by date desc", new Object[]{3}, new int[]{0,10}));
		 model.addAttribute("recoProblem", questionService.lists("from Question order by clickTimes desc", null, new int[]{0,10}));
		 List<Question> list=questionService.lists("from Question where question_Id=?",new Object[]{3}, null);
		 model.addAttribute("itemsize", list.size());
		 return "question_square/ask_for_exam";
	}
	
	@RequestMapping(value={"resources_share"},method=RequestMethod.GET)
	public String resources_share(Model model) {
		 model.addAttribute("question", questionService.lists("from Question where question_Id=? order by date desc", new Object[]{4}, new int[]{0,10}));
		 model.addAttribute("recoProblem", questionService.lists("from Question order by clickTimes desc", null, new int[]{0,10}));
		 List<Question> list=questionService.lists("from Question where question_Id=?",new Object[]{4}, null);
		 model.addAttribute("itemsize", list.size());
		 return "question_square/resources_share";
	}
	
     @ResponseBody
     @RequestMapping(value="list",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
     public String questions_list(Model model,int question_Id)
     {
    	if(question_Id==0)
    	{
          return jsonData(questionService.lists("from Question", null, new int[]{0,14}));
    	}else
    	{
    	  return jsonData(questionService.lists("from Question where question_Id=? order by date desc", new Object[]{question_Id}, new int[]{0,10}));
    	}
     }
    private String jsonData(List<Question> list)
     {
    	 JSONArray jsonArray=new JSONArray();
    	 for(Question q:list)
    	 {
    		 JSONObject js=new JSONObject();
    		 js.put("id", q.getId());
    		 js.put("title", q.getTitle());
    		 js.put("date", q.getDate().toString());
    		 js.put("user", q.getUser().getNickname());
    		 js.put("profile", q.getUser().getProfile());
    		 js.put("question_Id", q.getQuestion_Id());
    		 js.put("clickTimes", q.getClickTimes());
    		 js.put("comment_size", q.getComments().size());
    		 jsonArray.add(js);
    	 }
    	 return jsonArray.toString();
     }
     
     @RequestMapping(value="add",method=RequestMethod.GET)
     public String add()
     {
    	 return "question_square/add";
     }
     
     @ResponseBody
     @RequestMapping(value="add",method=RequestMethod.POST)
     public String add(Model model ,Question question,HttpServletRequest request)
     {
    	Question q=new Question();
    	q.setDate(new Date());
    	q.setContent(question.getContent());
    	q.setTitle(question.getTitle());
    	q.setQuestion_Id(question.getQuestion_Id());
    	q.setUser(userService.load("from User where username=?", 
    			new Object[]{request.getSession().getAttribute("session_login_username")}));
    	questionService.add(q);
    	return StringUtilXiaoQu.isRegisterValid;
     }
	
     
     @ResponseBody
 	 @RequestMapping(value="ImgUpload",method=RequestMethod.POST)
     public void ImgUpload(MultipartFile userPicture,HttpServletRequest request,HttpServletResponse response) throws IOException
     {
    	String userPictureName=userPicture.getOriginalFilename();
 		String userPicMd5=MD5Util.encryption(userPicture.getOriginalFilename())+"."+userPictureName.substring(userPictureName.lastIndexOf(".")+1);
 		String realPath=request.getSession().getServletContext().getRealPath("resource/img/question");
 		System.out.println(realPath);
 		File file=new File(realPath+"/"+userPicMd5);
 		FileUtils.copyInputStreamToFile(userPicture.getInputStream(), file);
 		//int id=userService.load("from User where username=?", new Object[]{(String)request.getSession().getAttribute("session_login_username")}).getId();
     	//userService.update("update User u set u.profile=? where id=?", new Object[]{userPicMd5,id});
     	
     	String picUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/resource/img/user/"+userPicMd5;
     	System.out.println(picUrl);
     	PrintWriter writer = response.getWriter();
 		writer.print("{");
 		writer.print("success:true"+","+"msg:error mesg");
 		writer.print("file_path:\"" + picUrl + "\"");
 		writer.print("}");
 		writer.close();
     }
     @RequestMapping(value="/questions/{id}",method=RequestMethod.GET)
     public String show(Model model,@PathVariable int id,HttpServletRequest request)
     {
    	 model.addAttribute("question", questionService.load(id));
    	 model.addAttribute("listComment",commentService.list("from Comment where question_id=? order by date desc", new Object[]{id}, null));
    	 questionService.update("update Question qu set qu.clickTimes=clickTimes+1 where id=?", new Object[]{id});
    	 
    	/* QuestionAttention qaAttention=questionAttebtionService
    			 .load("from QuestionAttention where question_id=? and user_id=?", new Object[]{id,});
    	 */
    	 
    	 User user=userService.load("from User where username=?",
    			 new Object[]{request.getSession().getAttribute("session_login_username")});
    	
    	 if(user!=null) {
	    	 if(questionLikeService.load("from QuestionLike where user_id=? and question_id=? ",new Object[]{user.getId(),id})==null) {
	    		 model.addAttribute("userlike","点赞");
	    	 }else {
	    		 model.addAttribute("userlike","已赞");
	    	 }
    	 }
    	 return "question_square/question";
     }
     @ResponseBody
 	 @RequestMapping(value="addComment",method=RequestMethod.POST)
     public String addComment(int id,String content,HttpServletRequest request)
     {
    	 int user_id=userService.load("from User where username=?", new Object[]{(String)request.getSession().getAttribute("session_login_username")}).getId();
    	 User u=userService.load(user_id);
    	 Question q=questionService.load(id);
    	 Comment comment=new Comment();
    	 comment.setContent(content);
    	 comment.setDate(new Date());
    	 comment.setUser(u);
    	 comment.setQuestion(q);
    	 commentService.add(comment);
 		return StringUtilXiaoQu.isRegisterValid;
    	 
     }
     @ResponseBody
 	 @RequestMapping(value="loadMore",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
     public String loadMore(int question_id,int curPage)
     {
    	 System.out.println(question_id+"-"+curPage);
    	 List<Question> list=new ArrayList<Question>();
    	 if(question_id==0)
    	 {
    		 list=questionService.lists("from Question  order by date desc", null, new int[]{curPage*10,10});
    	 }else
    	 {
        	 list=questionService.lists("from Question where question_id=? order by date desc", new Object[]{question_id}, new int[]{curPage*10,10}); 
    	 }
    	 return jsonData(list);
     }
     
     
     @ResponseBody
 	 @RequestMapping(value="addAttention",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
     public String addAttention(int question_id,HttpServletRequest request)
     {
    	 User user=userService.load("from User where username=?",
    			 new Object[]{request.getSession().getAttribute("session_login_username")});
    	 Question question=questionService.load(question_id);
    	 QuestionAttention qa=new QuestionAttention(question,user);
    	 if(questionAttebtionService.add(qa))
            return StringUtilXiaoQu.isRegisterValid;
    	 else
    	    return StringUtilXiaoQu.isRegisterValid;
     }
     @ResponseBody
 	 @RequestMapping(value="like",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
     public String like(int id,HttpServletRequest request) {
    	 User user=userService.load("from User where username=?",
    			 new Object[]{request.getSession().getAttribute("session_login_username")});
    	 if(questionLikeService.load("from QuestionLike where user_id=? and question_id=? ",new Object[]{user.getId(),id})==null) {
    		 QuestionLike ql=new QuestionLike();
    		 ql.setUser_id(user.getId());
    		 Question question=questionService.load(id);
    		 ql.setQuestion(question);
    		 questionLikeService.add(ql);
    		 return "已赞";
    	 }else {
    		 questionLikeService.delete("delete QuestionLike  where user_id=? and question_id=?",new Object[]{user.getId(),id});
    		 return "点赞";
    	 }
     }
}
