-- Database: StudyAssistant

-- DROP DATABASE "StudyAssistant";

CREATE DATABASE "StudyAssistant"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    

CREATE TYPE video_details AS
(
    description VARCHAR,
    category VARCHAR
);

CREATE TYPE credentials AS
(
	username VARCHAR,
    password VARCHAR
);

CREATE TABLE video
(
	video_id SERIAL PRIMARY KEY,
    details video_details NOT NULL,
    likes INT default 0
);

ALTER TABLE video ADD COLUMN url VARCHAR UNIQUE NOT NULL;

CREATE TABLE user_details
(
	user_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email_id VARCHAR UNIQUE NOT NULL,
    userlogin credentials UNIQUE NOT NULL
);

INSERT INTO user_details (name,email_id,userlogin) 
VALUES('Sagar Ailani','sagar.ailani@somaiya.edu',('sagarailani','1234'));

CREATE TABLE login_info OF credentials;
    
    
CREATE TABLE request 
(
    user_id INT REFERENCES user_details,
    request_id SERIAL PRIMARY KEY,
    details video_details NOT NULL
);

SELECT * FROM user_details;

INSERT into user_details (name,email_id,userlogin) values(('Sagar','Ailani'),'sagar.ailani@somaiya.edu',('sagar','pass'));


CREATE TABLE user_liked
(
	user_id INT REFERENCES user_details,
    video_list INT[] UNIQUE
);

CREATE TABLE user_viewed
(
	user_id INT REFERENCES user_details,
    video_list INT[] UNIQUE
);

SELECT * FROM VIDEO ORDER BY RANDOM() LIMIT 2;

INSERT INTO video (details,likes,url) VALUES(('Java Advanced','Java'),25,'link');
INSERT INTO video (details,likes,url) VALUES(('JSP and Servlet','Java'),40,'link2');
INSERT INTO video (details,likes,url) VALUES(('Spatial DB','DBMS'),10,'link3');
INSERT INTO video (details,likes,url) VALUES(('Object Oriented DB','DBMS'),25,'link4');

INSERT INTO user_liked VALUES(1,ARRAY[1]);

UPDATE user_liked SET video_list = video_list || 4 WHERE user_id = 1;
SELECT * FROM user_liked;

SELECT * FROM VIDEO;

SELECT video_id,details,likes,url FROM video JOIN user_liked ON video.video_id = ANY(video_list) WHERE user_id = 1;

SELECT * FROM video
WHERE (details).category = 'Java';
    
    
    
    
    
    
    
    
    
    
    
    
    