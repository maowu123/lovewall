package org.java.pojo;

import java.util.Date;
/**
 * 这个类用来给用户发消息提醒，如果有人在一条表白下面评论了，那么通知给发那个表白的人，
 * 		如果有人在一条表白下的评论被回复了，那么通知给评论的那个人
 * @author DELL
 *
 */
public class BiaobaiMessage {
	private int id;
	private int message_id;//对应的Message的id
	private Date post_date;//评论或回复的时间
	private int readed;//是否已经阅读
	private int from_uid;//评论或回复的用户
	private int to_uid;//评论或回复的目标用户
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getFrom_uid() {
		return from_uid;
	}
	public void setFrom_uid(int from_uid) {
		this.from_uid = from_uid;
	}
	public int getTo_uid() {
		return to_uid;
	}
	public void setTo_uid(int to_uid) {
		this.to_uid = to_uid;
	}
}
