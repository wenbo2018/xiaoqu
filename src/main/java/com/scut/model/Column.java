package com.scut.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_column")
public class Column
{
   private int id;
   private String columnName;
   private int classId;
   private String introduction;
   private int concernedNumber;
   private int clickNumber;
   private int campaignNumber;
   
   
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getConcernedNumber() {
		return concernedNumber;
	}
	public void setConcernedNumber(int concernedNumber) {
		this.concernedNumber = concernedNumber;
	}
	public int getClickNumber() {
		return clickNumber;
	}
	public void setClickNumber(int clickNumber) {
		this.clickNumber = clickNumber;
	}
	public int getCampaignNumber() {
		return campaignNumber;
	}
	public void setCampaignNumber(int campaignNumber) {
		this.campaignNumber = campaignNumber;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
}
