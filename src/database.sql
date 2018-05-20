CREATE TABLE users(
  userName VARCHAR(16),
  pword VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  country VARCHAR(32),
  description TEXT
);


CREATE TABLE articles(
  article_id INT,
  article_name VARCHAR(50),
  article_content TEXT,
  genre VARCHAR(25),
  author_id VARCHAR(16),
  PRIMARY KEY (article_id),
  FOREIGN KEY (author_id) REFERENCES users(userName)
);

ALTER TABLE articles ADD date TIMESTAMP DEFAULT current_timestamp;
ALTER TABLE users ADD session INT DEFAULT NULL;
ALTER TABLE users ADD image VARCHAR(30);
