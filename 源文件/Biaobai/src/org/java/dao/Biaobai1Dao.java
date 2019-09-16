package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai1;
public interface Biaobai1Dao {
	public void addBiaobai1(Biaobai1 biaobai1);
	public void deleteBiaobai1(int id);
	public void updateBiaobai1(Biaobai1 biaobai1);
	
	public List<Biaobai1> getAll();
	public Biaobai1 getById(int id);
}
