-- CREATING REQUIRED TABLE SCHEMAS

CREATE TABLE users (
	id serial PRIMARY KEY,
	username VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL
);

select * from users;

CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	content TEXT NOT NULL,
	media_url VARCHAR(255),
	user_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
)

select * from posts;

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	text TEXT NOT NULL,
	user_id INTEGER NOT NULL,
	post_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
)

select * from comments;

CREATE TABLE reactions (
	id SERIAL PRIMARY KEY,
	type VARCHAR(20) NOT NULL,
	user_id INTEGER NOT NULL,
	post_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
)

select * from reactions;


-- INSERTING DUMMY DATA TO TABLES 

INSERT INTO users (username, password) VALUES ('john_doe', 'password123');
INSERT INTO users (username, password) VALUES ('jane_smith', 'password456');


-- Posts by John Doe
INSERT INTO posts (content, media_url, user_id) VALUES ('Check out this funny meme!', 'http://example.com/meme1.jpg', 1);
INSERT INTO posts (content, media_url, user_id) VALUES ('Here is another cool meme!', 'http://example.com/meme2.jpg', 1);

-- Posts by Jane Smith
INSERT INTO posts (content, media_url, user_id) VALUES ('This video is hilarious!', 'http://example.com/video1.mp4', 2);
INSERT INTO posts (content, media_url, user_id) VALUES ('Look at this funny image!', 'http://example.com/image1.jpg', 2);


-- Comments on John's posts
INSERT INTO comments (text, user_id, post_id) VALUES ('This is hilarious!', 2, 1);
INSERT INTO comments (text, user_id, post_id) VALUES ('Love this meme!', 2, 2);

-- Comments on Jane's posts
INSERT INTO comments (text, user_id, post_id) VALUES ('Great video!', 1, 3);
INSERT INTO comments (text, user_id, post_id) VALUES ('So funny!', 1, 4);



-- Reactions to John's posts
INSERT INTO reactions (type, user_id, post_id) VALUES ('like', 2, 1);
INSERT INTO reactions (type, user_id, post_id) VALUES ('love', 2, 2);

-- Reactions to Jane's posts
INSERT INTO reactions (type, user_id, post_id) VALUES ('haha', 1, 3);
INSERT INTO reactions (type, user_id, post_id) VALUES ('like', 1, 4);


