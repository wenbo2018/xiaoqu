package com.scut.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.scut.dao.IUserDAO;
import com.scut.model.User;
import com.scut.util.MD5Util;

@Service("userService")
public class UserService implements IUserService
{
	private IUserDAO userDAO;
	public IUserDAO getUserDAO() 
	{
		return userDAO;
	}
    @Resource
	public void setUserDAO(IUserDAO userDAO) 
	{
		this.userDAO = userDAO;
	}
 
	@Override
	public void add(User user)
	{
		userDAO.add(user);
	}

	@Override
	public User load(int id)
	{
		return userDAO.load(id);
	}
	@Override
	public boolean login(String username, String password) 
	{
		String hql="from User where username=? and password=?";
		if(userDAO.load(hql, new Object[]{username,MD5Util.encryption(password)})==null)
		{
			return false;
		}else 
		{
		    return true;	
		}
	}
	
	@Override
	public boolean register(String username)
	{
		String hql="from User where username=?";
		System.out.println(userDAO.load(hql, new Object[]{username}));
		if(userDAO.load(hql, new Object[]{username})==null)
		{
			return true;
		}else 
		{   
		    return false;	
		}
	}
	@Override
	public List<User> user_list(String username,int[] index)
	{
		String hql=null;
		if(username==null)
		{
			 hql="from User";
		}
		else
		{
			 hql="from User where username=?";
		}
		
		return userDAO.list(hql, null, null);
	}
	@Override
	public User load(String hql, Object[] args) {
		return userDAO.load(hql, args);
	}
	@Override
	public void update(User user)
	{
		userDAO.update(user);
	}
	@Override
	public void update(String hql, Object[] args) 
	{
		userDAO.update(hql, args);
	}
	@Override
	public void show() {
		System.out.println("ddddddd");
	}
	@Override
	public boolean loginAdmin(String username, String password)
	{
		String hql="from User where username=? and password=?";
		User user=userDAO.load(hql, new Object[]{username,MD5Util.encryption(password)});
		if(user!=null&&user.getUserClass()==1)
		{
			return true;
		}else 
		{
		    return false;	
		}
	}
	@Override
	public List<User> lists(String hql, Object[] args, int[] index)
	{
		return userDAO.list(hql, args, index);
	}
}
