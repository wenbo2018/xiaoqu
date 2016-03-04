package com.scut.dao;
import org.springframework.stereotype.Repository;

import com.scut.model.User;
@Repository("userDao")
public class UserDao extends BaseDAO<User> implements IUserDAO
{
    

}
