package com.scut.model;


import java.lang.Thread.State;
import java.util.Date;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
@Entity
@Table(name="t_campaign")
public class Campaign
{
     private int id;
     private String title;
     private String content;  
     private int classId;
     private Date time;
     private int click_times;
     private int State;
     private String urlTitle;
     private String brief;
     private int click_like;

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
	public String getTitle() 
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content) 
	{
		this.content = content;
	}
	public int getClassId() 
	{
		return classId;
	}
	public void setClassId(int classId) 
	{
		this.classId = classId;
	}
	public int getClick_times() {
		return click_times;
	}
	public void setClick_times(int click_times) {
		this.click_times = click_times;
	}
    public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getState()
	{
		return State;
	}
	public void setState(int state)
	{
		State = state;
	}
	public String getUrlTitle()
	{
		return urlTitle;
	}
	public void setUrlTitle(String urlTitle)
	{
		this.urlTitle = urlTitle;
	}
	public String getBrief()
	{
		return brief;
	}
	public void setBrief(String brief)
	{
		this.brief = brief;
	}
	public int getClick_like()
	{
		return click_like;
	}
	public void setClick_like(int click_like)
	{
		this.click_like = click_like;
	}
}
