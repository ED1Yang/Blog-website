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
  PRIMARY KEY (userName)
);


CREATE TABLE articles(
  article_id INT AUTO_INCREMENT,
  article_name VARCHAR(50),
  article_content TEXT,
  genre VARCHAR(25),
  author_id VARCHAR(16),
  date TIMESTAMP DEFAULT current_timestamp,
  PRIMARY KEY (article_id)-- ,
  -- FOREIGN KEY (author_id) REFERENCES users(userName)
);

CREATE TABLE comments(
  article_id INT,
  userName VARCHAR(16),
  userComment TEXT,
  date TIMESTAMP DEFAULT current_timestamp,
  commentID INT AUTO_INCREMENT
  -- FOREIGN KEY (article_id) REFERENCES articles(article_id),
  -- FOREIGN KEY (userName) REFERENCES users(userName)
)
