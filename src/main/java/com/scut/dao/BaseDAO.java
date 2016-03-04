package com.scut.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class BaseDAO<T> extends HibernateDaoSupport implements IBaseDAO<T>
{   
	
    private Class<T> clz;
	
	@Resource
	private void setSuperSessionFactory(SessionFactory sessionFactory)
	{
		super.setSessionFactory(sessionFactory);
	}
	
    @SuppressWarnings("unchecked")
	private Class<T> getClz()
	{
		if(clz==null) 
		{
			clz = ((Class<T>)(((ParameterizedType)(this.getClass().getGenericSuperclass()))
							.getActualTypeArguments()[0]));
		}
		return clz;
	}
    
    private Query setParamterQuery(String hql, Object[] args)
	{
		Query query=this.getSession().createQuery(hql);
		if(args!=null)
		{
			for(int i=0;i<args.length;i++)
			{
				query.setParameter(i, args[i]);
			}
		}
		return query;
	}
    
    
    
    
    @Override
	public void add(T t) 
	{
	   this.getHibernateTemplate().save(t);
	}
    @Override
	public void update(T t) 
	{
		this.getHibernateTemplate().update(t);
	}
    @Override
    public void delete(int id) 
	{
		T t=load(id);
		this.getHibernateTemplate().delete(t);
	}
    @Override
	public T load(int id) 
	{
		return this.getHibernateTemplate().load(getClz(), id);
	}
	
    @Override
	public List<T> list(String hql, Object[] args,int[] index)
	{
		Query query;
		if(index==null)
		{   
			 query=setParamterQuery(hql, args);
		}else
		{
			 query=setParamterQuery(hql, args).setFirstResult(index[0]).setMaxResults(index[1]);
		}
		return query.list();
	}

    @Override
	public T load(String hql, Object[] args) {
		Query query=setParamterQuery(hql, args);
		return (T) query.uniqueResult();
	}
    @Override
	public void update(String hql, Object[] args)
	{
		Query query=setParamterQuery(hql, args);
		query.executeUpdate();
	}
   
    @Override
	public int findCount(String hql, Object[] agrs)
	{
		/*Query query=setParamterQuery(hql, agrs);
		
		long m=(long) query.list().get(0);;
		
		return Integer.parseInt(String.valueOf(m));*/
		return 0;
	}
    @Override
	public void delete(String hql, Object[] agrs)
	{
		Query query=setParamterQuery(hql, agrs);
		query.executeUpdate();
	}
}
