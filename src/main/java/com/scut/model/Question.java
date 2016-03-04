package com.scut.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="t_question")
public class Question 
{

	private int id;
	private String title;
	private String content;
	
	private Date date;
	
	private int clickTimes;
	
	private int question_Id;
	
	private User user;
	
	private Set<Comment> comments;
    
	private Set<QuestionAttention> questionAttentions;
	
	private Set<QuestionLike>  question_like;
	
	
	@GeneratedValue
	@Id
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getClickTimes() {
		return clickTimes;
	}

	public void setClickTimes(int clickTimes) {
		this.clickTimes = clickTimes;
	}

	public int getQuestion_Id() {
		return question_Id;
	}

	public void setQuestion_Id(int question_Id) {
		this.question_Id = question_Id;
	}
    
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@OneToMany(mappedBy="question")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<Comment> getComments() {
	return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(mappedBy="question")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<QuestionAttention> getQuestionAttentions()
	{
		return questionAttentions;
	}

	public void setQuestionAttentions(Set<QuestionAttention> questionAttentions)
	{
		this.questionAttentions = questionAttentions;
	}

	@OneToMany(mappedBy="question")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<QuestionLike> getQuestion_like() {
		return question_like;
	}

	public void setQuestion_like(Set<QuestionLike> question_like) {
		this.question_like = question_like;
	}
    
}
