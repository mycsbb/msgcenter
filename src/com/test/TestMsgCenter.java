package com.test;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.csrc.msgcenter.model.Department;
import com.csrc.msgcenter.model.Message;
import com.csrc.msgcenter.model.User;
import com.csrc.msgcenter.util.JSONUtil;

public class TestMsgCenter {
	private static String resource = "configuration.xml";
	private static SqlSessionFactory sessionFactory;

	static {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);
			if (reader != null) {
				reader.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void t01() {
		User user = new User(1, "chen1", "123", 1, 1, "陈", "123", 1);
		System.out.println(JSONUtil.toJSON(user));
		System.out.println("12,34".split(",").length);
	}

	@Test
	public void tMsgCenter() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		String json = "";
		// System.out.println("21,-3,33,".split(",").length);
		try {
			List<Department> departments = session
					.selectList("Department.queryAll");
			List<User> users = session.selectList("User.queryAll");
			for (Department department : departments) {
				json += departmentToJson(department) + ",";
			}
			for (User user : users) {
				json += userToJson(user) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		} finally {
			session.close();
		}
	}

	@Test
	public void tInsert() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		try {
			User user = new User();
			user.setUsername("lili");
			user.setPassword("abc001");
			User suser = session.selectOne("User.queryByUsername", "lilix");
			if (suser != null) {
				System.out.println("exist..");
				return;
			}
			int n = session.insert("User.insert", user);
			System.out.println("user.id: " + user.getId());
			session.commit();
			System.out.println("user.id: " + user.getId());
			System.out.println("n条记录受影响：" + n);
		} finally {
			session.close();
		}
	}

	@Test
	public void tQueryPhone() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		try {
			List<Integer> idlist = new ArrayList<Integer>();
			idlist.add(1);
			idlist.add(2);
			List<String> strs = session.selectList("User.queryPhones", idlist);
			for (String str : strs) {
				System.out.println(str);
			}
		} finally {
			session.close();
		}
	}

	@Test
	public void tMessageInsert() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		try {
			String sender = "180010";
			String receiver = "19000";
			String content = "hello..";
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			Message message = new Message(sender, receiver, content, timestamp);
			session.insert("Message.insert", message);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Test
	public void tQueryMultiLike() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		// MessageMapper mapper = session.getMapper(MessageMapper.class);
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("sender", "chen1");
			paramMap.put("receiver", "18010");
			List<Message> msgList = session.selectList("Message.queryByPhone",
					paramMap);
			for (Message msg : msgList) {
				System.out.println(msg);
			}
		} finally {
			session.close();
		}
	}

	@Test
	public void tQueryById() throws SQLException, IOException {
		SqlSession session = sessionFactory.openSession();
		try {
			User user = session.selectOne("User.queryById", 3);
			System.out.println(user);
		} finally {
			session.close();
		}
	}

	@Test
	public void tReadProperties() throws SQLException, IOException {
		String path=this.getClass().getResource("/").getPath();
		System.out.println(path);
		Properties prop = new Properties();
		try {
			// 读取属性文件a.properties
			InputStream in = new BufferedInputStream(new FileInputStream(
					path + "msgcenter.properties"));
			prop.load(in); // /加载属性列表
			Iterator<String> it = prop.stringPropertyNames().iterator();
			while (it.hasNext()) {
				String key = it.next();
				System.out.println(key + ":" + prop.getProperty(key));
			}
			in.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String userToJson(User user) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(User.class.getName(), "username,password,levelId,phone");
		String str = JSONUtil.toJSON(user, 0, false, filterMap, 1);
		str = str.substring(0, str.length() - 1) + ", \"is_person\": true}";

		return str;
	}

	public String departmentToJson(Department department) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(User.class.getName(), "rank");
		String str = JSONUtil.toJSON(department, 0, false, filterMap, 1);
		str = str.substring(0, str.length() - 1) + ", \"open\": true}";

		return str;
	}
}
