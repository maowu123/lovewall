package org.java.dao;
import java.util.List;

import org.java.pojo.User;
public interface IUserDao 
{
	public User login(String username, String password);
	public void addUser(User user);
	public void updateUser(User user);
}
