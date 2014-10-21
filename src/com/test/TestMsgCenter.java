package com.test;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.csrc.msgcenter.model.Department;
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
		User user = new User(1, "chen1", "123", 1, 1, "陈", "123");
		System.out.println(JSONUtil.toJSON(user));
		System.out.println("12,34".split(",").length);
	}
	
	@Test
	public void tMsgCenter() throws SQLException, IOException{
		SqlSession session = sessionFactory.openSession();
		String json = "";
		//System.out.println("21,-3,33,".split(",").length);
		try{
			List<Department> departments = session.selectList("Department.queryAll");
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
		}finally{
			session.close();
		}
	}
	
	@Test
	public void tQueryPhone() throws SQLException, IOException{
		SqlSession session = sessionFactory.openSession();
		try{
			List<Integer> idlist = new ArrayList<Integer>();
			idlist.add(1);
			idlist.add(2);
			List<String> strs = session.selectList("User.queryPhones", idlist);
			for (String str : strs) {
				System.out.println(str);
			}
		}finally{
			session.close();
		}
	}
	
	@Test
	public void tQueryById() throws SQLException, IOException{
		SqlSession session = sessionFactory.openSession();
		try{
			User user = session.selectOne("User.queryById", 3);
			System.out.println(user);
		}finally{
			session.close();
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
