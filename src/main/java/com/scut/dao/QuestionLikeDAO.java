package com.scut.dao;

import org.springframework.stereotype.Repository;

import com.scut.model.QuestionLike;
@Repository("questionLikeDao")
public class QuestionLikeDAO extends BaseDAO<QuestionLike> implements IQuestionLikeDAO{

}
