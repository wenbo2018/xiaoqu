package com.scut.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.scut.dao.IColumnDAO;
import com.scut.model.Column;


@Service("columnService")
public class ColumnService implements IColumnService
{
    private IColumnDAO columnDao;

	public IColumnDAO getColumnDao()
	{
		return columnDao;
	}
    @Resource
	public void setColumnDao(IColumnDAO columnDao)
    {
		this.columnDao = columnDao;
	}
	@Override
	public List<Column> list() 
	{
		return columnDao.list("from Column",null, null);
	}
	@Override
	public void update(Column column) 
	{
		columnDao.update(column);
	}
	@Override
	public Column load(int classId) 
	{
		return columnDao.load(classId);
	}
    
    
}
