CREATE TABLE author (
  id int NOT NULL,
  name varchar(30) NOT NULL,
  web varchar(100) NOT NULL,
  born date DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO author (id, name, web, born) VALUES (11, 'Jakub Vrana', 'http://www.vrana.cz/', NULL);
INSERT INTO author (id, name, web, born) VALUES (12, 'David Grudl', 'http://davidgrudl.com/', NULL);

CREATE TABLE tag (
  id int NOT NULL,
  name varchar(20) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tag (id, name) VALUES (21, 'PHP');
INSERT INTO tag (id, name) VALUES (22, 'MySQL');
INSERT INTO tag (id, name) VALUES (23, 'JavaScript');

CREATE TABLE application (
  id int NOT NULL,
  author_id int NOT NULL,
  title varchar(50) NOT NULL,
  web varchar(100) NOT NULL,
  slogan text NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT application_ibfk_1 FOREIGN KEY (author_id) REFERENCES author (id)
);

CREATE INDEX application_title ON application (title);

INSERT INTO application (id, author_id, title, web, slogan) VALUES (1, 11, 'Adminer', 'http://www.adminer.org/', 'Database management in single PHP file');
INSERT INTO application (id, author_id, title, web, slogan) VALUES (2, 11, 'JUSH', 'http://jush.sourceforge.net/', 'JavaScript Syntax Highlighter');
INSERT INTO application (id, author_id, title, web, slogan) VALUES (3, 12, 'Nette', 'http://nettephp.com/', 'Nette Framework');
INSERT INTO application (id, author_id, title, web, slogan) VALUES (4, 12, 'Dibi', 'http://dibiphp.com/', 'tiny ''n'' smart database layer');

CREATE TABLE application_tag (
  application_id int NOT NULL,
  tag_id int NOT NULL,
  PRIMARY KEY (application_id,tag_id),
  CONSTRAINT application_tag_ibfk_3 FOREIGN KEY (tag_id) REFERENCES tag (id),
  CONSTRAINT application_tag_ibfk_2 FOREIGN KEY (application_id) REFERENCES application (id) ON DELETE CASCADE
);

INSERT INTO application_tag (application_id, tag_id) VALUES (1, 21);
INSERT INTO application_tag (application_id, tag_id) VALUES (3, 21);
INSERT INTO application_tag (application_id, tag_id) VALUES (4, 21);
INSERT INTO application_tag (application_id, tag_id) VALUES (1, 22);
INSERT INTO application_tag (application_id, tag_id) VALUES (4, 22);
INSERT INTO application_tag (application_id, tag_id) VALUES (2, 23);
