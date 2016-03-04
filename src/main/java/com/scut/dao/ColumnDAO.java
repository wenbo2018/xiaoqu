package com.scut.dao;

import org.springframework.stereotype.Repository;

import com.scut.model.Column;


@Repository("columnDao")
public class ColumnDAO extends BaseDAO<Column> implements IColumnDAO
{

}
