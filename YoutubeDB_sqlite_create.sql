CREATE TABLE countries (
	country_code CHAR (2) 	  NOT NULL
						  	  CONSTRAINT [country code length] CHECK (length(country_code) <= 2),
	country_name VARCHAR (50) NOT NULL
							  CONSTRAINT [country name length] CHECK (length(country_name) <= 50),
	continent 	 VARCHAR (20) NOT NULL
							  CONSTRAINT [continent length] CHECK (length(continent) <= 20),
	PRIMARY KEY (
		country_code
	),
	UNIQUE (
		country_name
	)
);

CREATE TABLE channels (
	channel_id VARCHAR (50) 	NOT NULL
								CONSTRAINT [channel id length] CHECK (length(channel_id) <= 50),
	channel_title VARCHAR (50) 	NOT NULL
							   	CONSTRAINT [channel title length] CHECK (length(channel_title) <= 50),
	subscribers INT				NOT NULL
								CONSTRAINT [subscribers validity] CHECK (subscribers + 0 = subscribers AND
																		 round(subscribers) = subscribers AND
																		 subscribers >= 0),
	country CHAR (2)			NOT NULL
								CONSTRAINT [country length] CHECK (length(country) <= 2),
	PRIMARY KEY (
		channel_id
	),
	UNIQUE (
		channel_title,
		country
	),
	FOREIGN KEY (
		country
	)
	REFERENCES countries (country_code)
);

CREATE TABLE videos (
	video_id VARCHAR (11) 	NOT NULL
						  	CONSTRAINT [video id length] CHECK (length(video_id) <= 11),
	channel_id VARCHAR (50) NOT NULL
							CONSTRAINT [channel id length] CHECK (length(channel_id) <= 50),
	title VARCHAR (255)		NOT NULL
							CONSTRAINT [title length] CHECK (length(title) <= 255),
	info_id INT				NOT NULL
							CONSTRAINT [info id validity] CHECK (info_id + 0 = info_id AND
																 round(info_id) = info_id AND
																 info_id >= 0),
	PRIMARY KEY (
		video_id
	),
	UNIQUE (
		channel_id,
		title,
		info_id
	),
	FOREIGN KEY (
		channel_id
	)
	REFERENCES channels (channel_id),
	FOREIGN KEY (
		info_id
	)
	REFERENCES infos (info_id)
);

CREATE TABLE infos (
	info_id 	INTEGER NOT NULL 
						PRIMARY KEY 
						AUTOINCREMENT,
	category_id INT		NOT NULL
						CONSTRAINT [category id validity] CHECK (category_id + 0 = category_id AND
																 round(category_id) = category_id AND
																 category_id >= 0),
	trending_date DATETIME,
	views INT			NOT NULL
						CONSTRAINT [views validity] CHECK (views + 0 = views AND
														   round(views) = views AND
														   views >= 0),
	likes INT			NOT NULL
						CONSTRAINT [likes validity] CHECK (likes + 0 = likes AND
														   round(likes) = likes AND
														   (likes >= 0 OR (ratings_disabled = 1 AND likes = 0))),
	dislikes INT		NOT NULL
						CONSTRAINT [dislikes validity] CHECK (dislikes + 0 = dislikes AND
															  round(dislikes) = dislikes AND
															  (dislikes >= 0 OR (ratings_disabled = 1 AND dislikes = 0))),
	comment_count INT	NOT NULL
						CONSTRAINT [comment count validity] CHECK (comment_count + 0 = comment_count AND
																   round(comment_count) = comment_count AND
																   (comment_count >= 0 OR (comments_disabled = 1 AND comment_count = 0))),
	thumbnail_link VARCHAR (255) CONSTRAINT [thumbnail link length] CHECK (length(thumbnail_link) <= 255),
	comments_disabled BOOLEAN,
	ratings_disabled BOOLEAN,
	video_description VARCHAR (255) CONSTRAINT [video description length] CHECK (length(video_description) <= 255),
	runtime INT						CONSTRAINT [runtime validity] CHECK (runtime IS NULL OR 
																		 (runtime + 0 = runtime AND
																		  round(runtime) = runtime AND
																		  runtime > 0)),
	UNIQUE (
		category_id,
		trending_date,
		thumbnail_link,
		runtime
	),
	FOREIGN KEY (
		category_id
	)
	REFERENCES categories (category_id)
);

CREATE TABLE categories (
	category_id INTEGER 		NOT NULL
								PRIMARY KEY 
								AUTOINCREMENT,
	category_name VARCHAR (50)	NOT NULL
								CONSTRAINT [category name length] CHECK (length(category_name) <= 50) 
);
--
PRAGMA foreign_keys = ON;
