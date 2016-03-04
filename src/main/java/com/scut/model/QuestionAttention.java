package com.scut.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_questionAttention")
public class QuestionAttention
{
    private int id;
    private Question question;
    private User user;
    private boolean isAttention; 
    
    
     @Id 
     @GeneratedValue
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="question_id")
	public Question getQuestion()
	{
		return question;
	}
	public void setQuestion(Question question)
	{
		this.question = question;
	}
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
     
     public QuestionAttention(Question question,User user)
	 {
		this.question=question;
		this.user=user;
	 }
	public boolean isAttention()
	{
		return isAttention;
	}
	public void setAttention(boolean isAttention)
	{
		this.isAttention = isAttention;
	}
}
