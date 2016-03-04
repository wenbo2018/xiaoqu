package com.scut.dao;

import java.util.List;


public interface IBaseDAO<T>
{
	 public void add(T t);
	 
     public void update(T t);
     
     public void update(String hql,Object[] args);
     
     public void delete(int id);
     
     public void delete(String hql,Object[] agrs);
     
     
     public T load(int id);
     
     public T load(String hql,Object[] args);
     
     
     public List<T> list(String hql, Object[] args,int[] index);
     
     public int findCount(String hql ,Object[] agrs);
}
