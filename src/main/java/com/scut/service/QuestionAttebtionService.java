package com.scut.service;

import javax.annotation.Resource;

import org.omg.CORBA.OBJECT_NOT_EXIST;
import org.springframework.stereotype.Service;

import com.scut.dao.IQuestionAttebtionDao;
import com.scut.model.Question;
import com.scut.model.QuestionAttention;
import com.scut.model.User;


@Service("questionAttebtionService")
public class QuestionAttebtionService  implements IQuestionAttebtionService
{
    
	private IQuestionAttebtionDao questionAttebtionDao;

	public IQuestionAttebtionDao getQuestionAttebtionDao()
	{
		return questionAttebtionDao;
	}
    @Resource
	public void setQuestionAttebtionDao(IQuestionAttebtionDao questionAttebtionDao)
	{
		this.questionAttebtionDao = questionAttebtionDao;
	}

	@Override
	public boolean add(QuestionAttention questionAttention)
	{
		if(load(questionAttention.getUser(), questionAttention.getQuestion())==null)
		{
			load(questionAttention.getUser(), questionAttention.getQuestion());
			return true;
		}else
		{
			return false;
		}
	}

	@Override
	public void delete(int id)
	{
		questionAttebtionDao.delete(id);
	}
	@Override
	public QuestionAttention load(User user, Question question)
	{
		return questionAttebtionDao.load("from QuestionAttention where user=? and question=?", new Object[]{user,question});
	}
	@Override
	public QuestionAttention load(String hql, Object[] obj)
	{
		return questionAttebtionDao.load(hql, obj);
	}
    
}
