package com.scut.service;

import java.util.List;

import com.scut.model.Comment;


public interface ICommentService 
{

	public void add(Comment comment);
	public void delete(int id);
	public List<Comment> list(String hql,Object[] obj,int[] index );
	public void update(String hql, Object[] obj);
}
