CREATE TABLE users(
  userName VARCHAR(16),
  pword VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  country VARCHAR(32),
  description TEXT,
  image VARCHAR(30),
  session VARCHAR(50) DEFAULT NULL,
  isAdmin BOOLEAN NOT NULL DEFAULT 0,
  email VARCHAR(30),
  validateCode VARCHAR(50),
  ExpireTime MEDIUMTEXT,
  PRIMARY KEY (userName)
);

CREATE TABLE articles(
  article_id INT AUTO_INCREMENT NOT NULL,
  article_name VARCHAR(50),
  article_content TEXT,
  genre VARCHAR(25),
  author_id VARCHAR(16),
  date TIMESTAMP DEFAULT current_timestamp,
  isHidden BOOLEAN,
  PRIMARY KEY (article_id)
);

CREATE TABLE comments(
  article_id INT,
  userName VARCHAR(16),
  userComment TEXT,
  date TIMESTAMP DEFAULT current_timestamp,
  commentID INT AUTO_INCREMENT NOT NULL,
  isHidden BOOLEAN DEFAULT FALSE,
  parentComment int DEFAULT 0,
  PRIMARY KEY (commentID)
)
