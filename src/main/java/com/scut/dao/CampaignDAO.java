package com.scut.dao;


import org.springframework.stereotype.Repository;

import com.scut.model.Campaign;

@Repository("campaignDAO")
public class CampaignDAO extends BaseDAO<Campaign> implements ICampaignDAO
{

	
}
