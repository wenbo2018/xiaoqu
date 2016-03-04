package com.scut.service;

import com.scut.model.Question;
import com.scut.model.QuestionAttention;
import com.scut.model.User;

public interface IQuestionAttebtionService
{
    public boolean add(QuestionAttention questionAttention);
    
    public void delete(int id);
    
    public QuestionAttention load(String hql, Object[] obj);
    
    public QuestionAttention load(User user,Question question);
  
}
