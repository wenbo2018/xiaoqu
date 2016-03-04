package com.scut.service;

import java.util.List;

import com.scut.model.Question;


public interface IQuestionService 
{

	public List<Question> lists(String hql, Object[] obj,int[] index);
	public Question load(int id);
	public Question load(String hql, Object[] obj);
	public void delete(int id);
	public void add(Question question);
	public void update(String hql, Object[] obj);
}
