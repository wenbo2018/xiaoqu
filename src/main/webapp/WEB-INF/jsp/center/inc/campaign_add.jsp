<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="information_list_add" style="display: none">

<div class="row">
   <div class="col-md-12">
   <form class="navbar-form pull-left">
     标题<input class="campaign_update_title" id="campaign_title"  type="text"  name="title" width="300px">
    类别<select name="classId" id="campaign_id" class="campaign_class_select" >
		              <option value ="1">学术讲座</option>
					  <option value ="2">文体活动</option>
					  <option value="3">赛事纷呈</option>
					  <option value="4">吃喝玩乐</option>
					  <option value ="5">公益实践</option>
					  <option value ="6">读研考公</option>
					  <option value="7">留学交换</option>
					  <option value ="8">就业实习</option>
					  <option value="9">校内指南</option>
					  </select>
   </form>
   </div>
</div>
<div class="row">
   <div class="col-md-12">
   <textarea id="campaign_editor"  data-autosave="editor-content"  autofocus required></textarea>
   <br>
   <button class="btn btn-success" type="button" id="canmpaignManager_canmpaign_add" >发布</button>
   </div>
</div>
