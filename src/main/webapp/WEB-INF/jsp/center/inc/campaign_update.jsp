<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="information_list_update" style="display: none">
<sf:form method="post" id="content_add_id" >
		<table>
	        <tr >
	            <td>标题</td><td><input class="campaign_update_title" id="title_input" type="text"  disabled="true " name="title" width="300px"></td>
	                   <input type="hide" name="" id="campaign_Id" />
	        </tr>
		    <tr>
		         <td>板块</td>
		         <td>
		              <select name="classId" id="select_id" class="campaign_class_select" >
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
		         </td>
		    </tr>
			</table>
			<tr colapan="2">
			     <textarea id="editor_campaign_update" data-autosave="editor-content"  autofocus required></textarea>
			</tr>
			<tr colapan="2">
			      <input  type="button" id="submit_id" value="发布"/>
			</tr>
</sf:form>
</div>