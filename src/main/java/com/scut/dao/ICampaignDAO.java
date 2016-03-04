package com.scut.dao;

import java.util.List;

import com.scut.model.Campaign;


public interface ICampaignDAO extends IBaseDAO<Campaign>
{
    public List<Campaign> list(String hql, Object[] args,int[] index);
    
    public void add(Campaign campaign);
    
    public void delete(int id);
    
    public Campaign load(int id);
    
    public void update(Campaign campaign);
    
    public void update(String hql,Object[] args);
    
}
