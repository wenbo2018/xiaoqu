package com.scut.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.scut.dao.ICommentDAO;
import com.scut.model.Comment;

@Service("commentService")
public class CommentService implements ICommentService{
    
	private ICommentDAO commentDao;

	public ICommentDAO getCommentDao() {
		return commentDao;
	}
    @Resource
	public void setCommentDao(ICommentDAO commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public void add(Comment comment)
	{
		commentDao.add(comment);
	}

	@Override
	public void delete(int id)
	{
		commentDao.delete(id);
	}

	@Override
	public List<Comment> list(String hql, Object[] obj,int[] index)
	{
		
		return commentDao.list(hql, obj,index);
	}
	@Override
	public void update(String hql, Object[] obj) {
		commentDao.update(hql, obj);
	}

}
