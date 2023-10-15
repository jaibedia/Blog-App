package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.Category;
import com.dto.Post;
import com.factory.ConnectionFactory;

public class PostDao {
	
	public PostDao() {
		
	}
	
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<Category>();
		try {
			
			String quary = "select * from categories";
			Connection con = ConnectionFactory.getConnection();
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(quary);
			
			 while(rs.next()) {
				 int cid = rs.getInt("cid");
				 String name = rs.getString("name");
				 String description = rs.getString("description");
				 Category cat = new Category();
				 cat.setCid(cid);
				 cat.setName(name);
				 cat.setDescription(description);
				 list.add(cat);
			 }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean flag =false;
		try {
			
			String quary = "insert into posts(`pTitle`, `pContent`, `pCode`, `pPic`, `cid`, `userid`) values (?,?,?,?,?,?)";
			Connection con = ConnectionFactory.getConnection();
			PreparedStatement ps = con.prepareStatement(quary);
			ps.setString(1, post.getpTitle());
			ps.setString(2, post.getpContent());
			ps.setString(3, post.getpCode());
			ps.setString(4, post.getpPic());
			ps.setInt(5, post.getCid());
			ps.setInt(6, post.getUserid());
			ps.executeUpdate();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}
		
		
		
		return flag;
	}
	
	//get all posts
	public ArrayList<Post> getAllPosts(){
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			Connection con = ConnectionFactory.getConnection();
			//pid, pTitle, pContent, pCode, pPic, cid, userid
			
			PreparedStatement ps = con.prepareStatement("select * from posts order by pid desc");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				int userid = rs.getInt("userid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				
				Post post = new Post();
				
				post.setPid(pid);
				post.setpTitle(pTitle);
				post.setpContent(pContent);
				post.setpCode(pCode);
				post.setpPic(pPic);
				post.setUserid(userid);
				list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
	}
	
	//get posts by id
	public ArrayList<Post> getPostsByCatId( int cid){
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			Connection con = ConnectionFactory.getConnection();
			//pid, pTitle, pContent, pCode, pPic, cid, userid
			
			PreparedStatement ps = con.prepareStatement("select * from posts where cid=?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("pid"));
				int pid = rs.getInt("pid");
				int userid = rs.getInt("userid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				
				Post post = new Post();
				
				post.setPid(pid);
				post.setpTitle(pTitle);
				post.setpContent(pContent);
				post.setpCode(pCode);
				post.setpPic(pPic);
				post.setUserid(userid);
				list.add(post);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	public Post getPostByPostId(int id) {
		 Post post = null;
		 try {
			Connection con = ConnectionFactory.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from posts where pid=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				//pid, pTitle, pContent, pCode, pPic, cid, userid
				post = new Post();
				post.setPid(rs.getInt("pid"));
				post.setpTitle(rs.getString("pTitle"));
				post.setpContent(rs.getString("pContent"));
				post.setpCode(rs.getString("pCode"));
				post.setpPic(rs.getString("pPic"));
				post.setCid(rs.getInt("cid"));
				post.setUserid(rs.getInt("userid"));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		 
		 
		 return post; 
		
	}
	

}









































