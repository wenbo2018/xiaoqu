package com.scut.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.scut.dao.QuestionLikeDAO;
import com.scut.model.QuestionLike;

@Service("questionLikeService")
public class QuestionLikeService implements IQuestionLikeService {
	
    private QuestionLikeDAO questionLikeDao;

	public QuestionLikeDAO getQuestionLikeDao() {
		return questionLikeDao;
	}
    @Resource
	public void setQuestionLikeDao(QuestionLikeDAO questionLikeDao) {
		this.questionLikeDao = questionLikeDao;
	}
	@Override
	public QuestionLike load(String hql, Object[] obj) {
		return questionLikeDao.load(hql, obj);
	}
	@Override
	public void add(QuestionLike questionLike) {
		questionLikeDao.add(questionLike);
	}
	@Override
	public void delete(String hql, Object[] obj) {
		questionLikeDao.delete(hql, obj);
	}
}
