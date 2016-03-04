package com.scut.service;

import java.util.List;

import com.scut.model.Column;




public interface IColumnService 
{
     public List<Column> list();
     public void update(Column column);
     public Column load(int classId);
}
