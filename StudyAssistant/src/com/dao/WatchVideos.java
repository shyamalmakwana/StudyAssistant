package com.dao;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import com.beans.VideoBean;
public class WatchVideos {
	
	public static Map<Integer,VideoBean> viewVideos()
	{
		Connection con = null;		
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT * FROM VIDEO ORDER BY RANDOM() LIMIT 20";
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				Struct details = (Struct)rs.getObject(2);
				Object videodetails[] = details.getAttributes();
				int likes = rs.getInt(3);
				String url = rs.getString(4);
				video.put(videoid,new VideoBean((String)videodetails[0],(String)videodetails[1],likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;
	}
	
	public static Map<Integer,VideoBean> getLiked(int userid)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT video_id,details,likes,url FROM video JOIN user_liked ON video.video_id = ANY(video_list) WHERE user_id = "+userid;
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				Struct details = (Struct)rs.getObject(2);
				Object videodetails[] = details.getAttributes();
				int likes = rs.getInt(3);
				String url = rs.getString(4);
				video.put(videoid,new VideoBean((String)videodetails[0],(String)videodetails[1],likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
	
	public static Map<Integer,VideoBean> getPreviouslyViewed(int userid)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT video_id,details,likes,url FROM video JOIN user_viewed ON video.video_id = ANY(video_list) WHERE user_id = "+userid;
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				Struct details = (Struct)rs.getObject(2);
				Object videodetails[] = details.getAttributes();
				int likes = rs.getInt(3);
				String url = rs.getString(4);
				video.put(videoid,new VideoBean((String)videodetails[0],(String)videodetails[1],likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
	public static Map<Integer,VideoBean> getCategory(String category)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT * FROM video WHERE (details).category = '"+category+"'";
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				Struct details = (Struct)rs.getObject(2);
				Object videodetails[] = details.getAttributes();
				int likes = rs.getInt(3);
				String url = rs.getString(4);
				video.put(videoid,new VideoBean((String)videodetails[0],(String)videodetails[1],likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
}
