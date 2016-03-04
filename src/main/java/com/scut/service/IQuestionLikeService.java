package com.scut.service;

import com.scut.model.QuestionLike;

public interface IQuestionLikeService {
     public QuestionLike load(String hql,Object[] obj);
     public void add(QuestionLike questionLike);
     public void delete(String hql,Object[] obj);
}
