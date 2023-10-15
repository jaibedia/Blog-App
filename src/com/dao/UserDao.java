package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.User;
import com.factory.ConnectionFactory;

public class UserDao {
	public boolean save(User u) {
		boolean flag = false;
		try {

			String query = "insert into users(`name`,`email`,`password`,`gender`) values(?,?,?,?)";
			Connection con = ConnectionFactory.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getGender());

			ps.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
	
//	login..........
	public User getUserByEmailAndPassword(String email, String pass) throws SQLException {
		User user = null;
		
		Connection con = ConnectionFactory.getConnection();
		String quary = "select * from users where email=? and password=?";
		PreparedStatement ps = con.prepareStatement(quary);
		ps.setString(1, email);
		ps.setString(2, pass);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user = new User();
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			user.setName(rs.getString("name"));
			user.setGender(rs.getString("gender"));
			user.setProfile(rs.getString("profile"));
		}
		
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f =false;
		try {
			
		Connection con = ConnectionFactory.getConnection();
		String quary = "update users set name=? , email=? , gender=? ,profile=? where id=?";
		PreparedStatement ps = con.prepareStatement(quary);
		ps.setString(1, user.getName());
		ps.setString(2, user.getEmail());
		ps.setString(3, user.getGender());
		ps.setString(4, user.getProfile());
		ps.setInt(5, user.getId());
		ps.execute();
		f=true;
		
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

}
