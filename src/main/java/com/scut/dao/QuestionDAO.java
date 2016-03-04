package com.scut.dao;

import org.springframework.stereotype.Repository;

import com.scut.model.Question;
@Repository("questionDao")
public class QuestionDAO extends BaseDAO<Question> implements IQuestionDAO
{

}
