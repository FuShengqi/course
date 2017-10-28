CREATE TABLE t_notify(
  id int PRIMARY KEY AUTO_INCREMENT,
  title TEXT,
  content TEXT,
  publisher CHAR(20),
  time CHAR(32),
  receiver INT,
  delete_flag INT,
  FOREIGN KEY (publisher) REFERENCES t_admin(no)
)