package org.java.pojo;

import java.util.Date;
/**
 * ������������û�����Ϣ���ѣ����������һ��������������ˣ���ô֪ͨ�����Ǹ���׵��ˣ�
 * 		���������һ������µ����۱��ظ��ˣ���ô֪ͨ�����۵��Ǹ���
 * @author DELL
 *
 */
public class BiaobaiMessage {
	private int id;
	private int message_id;//��Ӧ��Message��id
	private Date post_date;//���ۻ�ظ���ʱ��
	private int readed;//�Ƿ��Ѿ��Ķ�
	private int from_uid;//���ۻ�ظ����û�
	private int to_uid;//���ۻ�ظ���Ŀ���û�
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
