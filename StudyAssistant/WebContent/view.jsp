<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="java.util.*"
    import="com.beans.VideoBean"
    import="com.dao.WatchVideos"
    %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Watch Videos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .navbar{
                border-color: black;
            }
            .navbar-default{
                height: 90px;
                background-color: black;
                font-size: 20px;                
                color: white;                
            }
            #sidebar{                       
                display: block;
                float: left;
                min-width: 250px;
                max-width: 250px;
                height: 100vh;
                background-color: lightgray;
                color: #fff;
            }
            #submenu{
                background-color: lightslategrey;
            }
            #sidebar ul li a{
                text-decoration: none;
                padding: 10px;
                font-size: 1.1em;
                display: block;
                color: black;
            }
            section{          
                padding-top: 20px;
                display: block;
                float: right;                
                width: 80%;                
            }            
            .video{
                margin-left: 10%;
            }
        </style>
    </head>
    
    <body> 
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" style="padding-left: 10px;">
                    <a class="navbar-brand" href="#"><img src = "logo1.png" alt="Logo" style="width:220px;height:65px;"></a>
                </div>
            </div>
        </nav>
        <aside>
            <nav id="sidebar">                
                <ul class="list-unstyled nav nav-pills nav-stacked">
                    <li><a href="#home">Home</a></li>
                    <li>
                        <a href="#submenu" data-toggle="collapse" aria-expanded="false">Browse by Topic <span class="caret"></span></a>
                        <ul id="submenu" class="collapse list-unstyled nav nav-pills nav-stacked">
                            <li><a href="#c">C</a></li>
                            <li><a href="#c++">C++</a></li>
                            <li><a href="#java">Java</a></li>
                            <li><a href="#python">Python</a></li>
                            <li><a href="#ds">Datastructures</a></li>
                            <li><a href="#db">Databases</a></li>
                        </ul>
                    </li>
                    <li><a href="#liked">Watch Liked</a></li>
                    <li><a href="#history">Watch Previously Viewed</a></li>
                </ul><hr>
            </nav>                        
        </aside>
        <%! 
        	Map<Integer,VideoBean> videos;         	
        	VideoBean bean;
        %>
        <%         
        	videos = WatchVideos.viewVideos();
        %>
        <section>           
        
            <div class="row">
            <% 
        		for(Map.Entry<Integer,VideoBean> pair: videos.entrySet())
        		{
        			int id = pair.getKey();
        			bean = pair.getValue();
        			String url = bean.getUrl();
        			String description = bean.getDescription();
        			String category = bean.getCategory();
        			int likes = bean.getLikes();
        	%>
                <div class="col-md-5">
                    <div class="thumbnail">
                    <iframe width="420" height="250" src="<%=url %>" allowfullscreen></iframe>                
                    <div class="caption">                    
                        <h4>Title:<%=description%></h4><p> </p>
                        <h4>Topic:<%=category %></h4><p> </p>
                    </div>
                    <button class="btn btn-success btn-md" style="margin-left: 85%;">Like</button>
                    </div>                    
                </div>
            <% } %>                
            </div>                    
        </section>
    </body>
</html>