package com.scut.service;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.scut.dao.ICampaignDAO;
import com.scut.model.Campaign;

@Service("campaignService")
public class CampaignService implements ICampaignService
{
	
	private ICampaignDAO campaignDAO;
	public ICampaignDAO getCampaignDAO() {
		return campaignDAO;
	}
    @Resource
	public void setCampaignDAO(ICampaignDAO campaignDAO) {
		this.campaignDAO = campaignDAO;
	}
    
    
	@Override
	public List<Campaign> list(String hql, Object[] args,int[] index)
	{   
		return campaignDAO.list(hql, args, index);
	}

	@Override
	public void add(Campaign campaign) 
	{
		campaignDAO.add(campaign);
	}

	@Override
	public void delete(int id) 
	{
		campaignDAO.delete(id);
	}

	@Override
	public Campaign load(int id)
	{
		return campaignDAO.load(id);
	}
	@Override
	public void update(Campaign campaign)
	{ 
		campaignDAO.update(campaign);
	}
	@Override
	public void update(int id) 
	{
		String hql="update Campaign ca set ca.click_times=click_times+1 where id=?";
		campaignDAO.update(hql, new Object[]{id});
	}
	@Override
	public int findCount(String hql, Object[] agrs)
	{
		campaignDAO.findCount(hql, agrs);
		return 0;
	}
	@Override
	public void update(String hql, Object[] args)
	{
		campaignDAO.update(hql, args);
	}

}
