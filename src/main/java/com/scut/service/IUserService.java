package com.scut.service;

import java.util.List;

import com.scut.model.User;

public interface IUserService
{

	public void add(User user);
	
	
	
	public User load(int id);

	
    public boolean login(String username,String password);
    

 	
     public boolean loginAdmin(String username,String password);
    

    public boolean register(String username);
    
    
    public List<User> user_list(String username,int[] index);
    
    public User load(String hql,Object[] args);
    
    public void update(User user);
    
    public void update(String hql,Object[] args);
    
    public void show();
    
    public List<User> lists(String hql, Object[] args,int[] index);
    
}
