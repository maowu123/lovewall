package org.java.dao;

import java.util.List;

import org.java.pojo.Biaobai4;
public interface Biaobai4Dao {
	public void addBiaobai4(Biaobai4 biaobai4);
	public void deleteBiaobai4(int id);
	public void updateBiaobai4(Biaobai4 biaobai4);
	public List<Biaobai4> getAll();
	public Biaobai4 getById(int id);
}
