package com.scut.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.scut.dao.IQuestionDAO;
import com.scut.model.Question;



@Service("questionService")
public class QuestionService implements IQuestionService
{

	private IQuestionDAO questionDao;

	public IQuestionDAO getQuestionDao()
	{
		return questionDao;
	}
    @Resource
	public void setQuestionDao(IQuestionDAO questionDao) 
    {
		this.questionDao = questionDao;
	}
	@Override
	public List<Question> lists(String hql, Object[] obj, int[] index) 
	{
		return questionDao.list(hql, obj, index);
	}
	@Override
	public Question load(int id) 
	{
		return questionDao.load(id);
	}
	@Override
	public void delete(int id) 
	{
		questionDao.delete(id);
	}
	@Override
	public void add(Question question)
	{
		questionDao.add(question);
	}
	@Override
	public void update(String hql, Object[] obj) {
		questionDao.update(hql, obj);
	}
	@Override
	public Question load(String hql, Object[] obj) {
		return questionDao.load(hql, obj);
	}
}
