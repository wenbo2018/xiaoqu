package com.scut.model;

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



/** 
* @ClassName: User 
* @Description: TODO(鐢ㄦ埛绫�) 
* @author Wenbo Shen 
* @date 2015骞�11鏈�24鏃� 涓婂崍9:51:31 
*  
*/
@Entity
@Table(name="t_user")
public class User 
{
    private int id;
    private String username;
    private String nickname;
    private String password;
    private int userClass;
    private String email;
    private int sexClass;
    private Set<Comment> comments;
    private String profile;
    private Set<Question> questions;
    
    private Set<QuestionAttention> questionAttention;
    
    @GeneratedValue
    @Id
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserClass() {
		return userClass;
	}
	public void setUserClass(int userClass) {
		this.userClass = userClass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSexClass() {
		return sexClass;
	}
	public void setSexClass(int sexClass) {
		this.sexClass = sexClass;
	}
	@OneToMany(mappedBy="user")
	@LazyCollection(LazyCollectionOption.EXTRA)
    public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@OneToMany(mappedBy="user")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
	@OneToMany(mappedBy="user")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<QuestionAttention> getQuestionAttention()
	{
		return questionAttention;
	}
	public void setQuestionAttention(Set<QuestionAttention> questionAttention)
	{
		this.questionAttention = questionAttention;
	}

}
