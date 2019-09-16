package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.java.dao.IBiaobaiDao;
import org.java.pojo.BiaobaiMessage;
import org.java.util.DBUtil;


public class BiaobaiDao implements IBiaobaiDao{

	@Override
	public void add(BiaobaiMessage biaobai) {
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into t_biaobai(id,message_id,post_date,readed,from_uid,to_uid) values (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, biaobai.getId());
			preparedStatement.setInt(2, biaobai.getMessage_id());
			preparedStatement.setTimestamp(3, new Timestamp((new Date().getTime())));
			preparedStatement.setInt(4, biaobai.getReaded());
			preparedStatement.setInt(5, biaobai.getFrom_uid());
			preparedStatement.setInt(6, biaobai.getTo_uid());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void delete(int id) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from t_biaobai where id=?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void update(BiaobaiMessage biaobai) {
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		
		try{
			connection = DBUtil.getConnection();
			String sql = "update t_biaobai set message_id=?,readed=?,from_uid=?,to_uid=? where id=?";
			
			preparedStatement = connection.prepareStatement(sql);
			//从User对象里面取得相应的�??,放到sql语句中对应的位置�?
			preparedStatement.setInt(1, biaobai.getMessage_id());
			preparedStatement.setInt(2, biaobai.getReaded());
			preparedStatement.setInt(3, biaobai.getFrom_uid());
			preparedStatement.setInt(4, biaobai.getTo_uid());
			preparedStatement.setInt(5, biaobai.getId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public BiaobaiMessage load(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<BiaobaiMessage> list(int to_uid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<BiaobaiMessage> pager = new ArrayList<BiaobaiMessage>();
		List<BiaobaiMessage> biaobais = new ArrayList<BiaobaiMessage>(); 
		BiaobaiMessage biaobai = null;
		try {
			connection = DBUtil.getConnection();
			String sqlCount = "select count(*) from t_biaobai where to_uid=?";
			//查询总记录数,两个查询不相�?
			preparedStatement = connection.prepareStatement(sqlCount);
			preparedStatement.setInt(1,to_uid);
			resultSet = preparedStatement.executeQuery();
			//总记录数
			
			//查分页数�?
			String sql = "select * from t_biaobai where to_uid = ? order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,to_uid);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				//id,content,comment_id,message_id,post_date,readed,from_uid,to_uid,reply_id,kind
				biaobai = new BiaobaiMessage();
				biaobai.setId(resultSet.getInt("id"));
				biaobai.setMessage_id(resultSet.getInt("message_id"));
				biaobai.setPost_date(new Date(resultSet.getTimestamp("post_date").getTime()));
				biaobai.setReaded(resultSet.getInt("readed"));
				biaobai.setFrom_uid(resultSet.getInt("from_uid"));
				biaobai.setTo_uid(resultSet.getInt("to_uid"));
				biaobais.add(biaobai);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobais;
	}

	@Override
	public List<BiaobaiMessage> list() {
		// TODO Auto-generated method stub
		return null;
	}
}
