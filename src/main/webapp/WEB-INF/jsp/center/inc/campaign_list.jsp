<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <div id="information_list_id"style="display: none" >				        
		<form class="navbar-form pull-left">
		<select  name="classId"  id="select_change" class="campaign_class_select" >
		              <option value ="0">全部</option>
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
		<input type="text" class="span2">
		<button type="submit" class="btn btn-success" placeholder="搜索">搜索</button>
		</form> 
        <table class="table table-bordered" id="table_id">
         
		</table>
		<ul class="pagination" id="page">
   
		</ul>
		
		
</div>