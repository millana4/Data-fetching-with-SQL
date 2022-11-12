/* Creating database for a misuc site */

CREATE TABLE IF NOT EXISTS Albums(
	album_id serial PRIMARY KEY,
	title varchar(40) NOT NULL,
	issue_year date 
);
CREATE TABLE IF NOT EXISTS Digests(
	digest_id serial PRIMARY KEY,
	title varchar(40) NOT NULL,
	issue_year date
);
CREATE TABLE IF NOT EXISTS Tracks(
	track_id serial PRIMARY KEY,
	title varchar(40) NOT NULL,
	duration integer NOT NULL CHECK(duration>0 AND duration<3600),
	album_id integer REFERENCES Albums(album_id)
);
CREATE TABLE IF NOT EXISTS Digests_Tracks(
	track_id serial REFERENCES Tracks(track_id),
	digest_id serial REFERENCES Digests(digest_id),
	CONSTRAINT pk PRIMARY KEY (track_id, digest_id)
);
CREATE TABLE IF NOT EXISTS Performers(
	performer_id serial PRIMARY KEY,
	title varchar(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Performers_Albums(
	performer_id serial REFERENCES Performers(performer_id),
	album_id serial REFERENCES Albums(album_id),
	CONSTRAINT pk1 PRIMARY KEY (performer_id, album_id)
);
CREATE TABLE IF NOT EXISTS Jenres(
	jenre_id serial PRIMARY KEY,
	title varchar(40) NOT NULL UNIQUE 
);
CREATE TABLE IF NOT EXISTS Jenres_Performers(
	performer_id serial REFERENCES Performers(performer_id),
	jenre_id serial REFERENCES Jenres(jenre_id),
	CONSTRAINT pk2 PRIMARY KEY (performer_id, jenre_id)
);


/* Filling database for a music site */

INSERT INTO Performers(title)
     VALUES 
    	('Madonna'),
 		('50cent'),
		('The Doors'),
	    ('Nirvana'),
		('Vivaldi'),
		('Tchaikovsky'),
		('Glenn Miller'),
		('Louis Armstrong'),
		('Kanye West');
	
INSERT INTO Jenres(title)
     VALUES 
    	('Pop music'),
		('Jazz'),
		('Classic'),
		('Rock'),
		('Rap');

INSERT INTO Albums(title, issue_year)
     VALUES 
    	('Like a Prayer', '1989-01-01'),
 		('Erotica', '1992-01-01'),
		('American Life', '2003-01-01'),
		('Nevermind', '1991-01-01'),
		('Bleach', '1989-01-01'),
		('The four seasons', '1723-01-01'),
		('Waiting for the Sun', '1968-01-01'),
		('Strange Days', '1967-01-01'),
		('Ye', '2018-01-01'),
		('Madame X', '2019-01-01'),
		('Jesus Is King', '2019-01-01'),
		('The Swan Lake', '2020-01-01'),
		('Curtis', '2007-01-01'),
		('Glenn Miller and His Orchestra', '1945-01-01'),
		('Louis Armstrong and His Friends', '1971-01-01');    

INSERT INTO Tracks(title, duration, album_id)
     VALUES 
    	('Smells Like Teen Spirit', 301, 4),
		('In Bloom', 254, 4),
		('Come as You Are', 219, 4),
		('Breed', 183, 4),
		('Lithium', 257, 4),
		('Polly', 177, 4),
		('Territorial Pissings', 142, 4),
		('Drain You', 223, 4),
		('Lounge Act', 156, 4),
		('Stay Away', 212, 4),
		('On a Plain', 196, 4),
		('Something in the Way', 232, 4),
		('Endless, Nameless', 403, 4),
		('Blew', 175, 5),
		('Floyd the Barber', 138, 5),
		('About a Girl', 168, 5),
		('School', 224, 5),
		('Can you feel my Love Buzz', 215, 5),
		('Paper Cuts', 244, 5),
		('Negative Creep', 176, 5),
		('Medellín', 298, 10),
		('Dark Ballet"', 254, 10),
		('God Control', 379, 10),
		('Future', 233, 10),
		('Batuka', 297, 10),
		('Killers Who Are Partying', 328, 10),
		('Crave', 201, 10),
		('Crazy', 242, 10),
		('Come Alive', 242, 10),
		('Faz Gostoso', 245, 10),
		('Bitch Im Loca', 49, 10),
		('I Dont Search I Find', 248, 10),
		('I Rise', 244, 10),
		('Every Hour', 112, 11),
		('Selah', 165, 11),
		('Follow God', 104, 11),
		('Closed on Sunday', 152, 11),
		('On God', 136, 11),
		('Everything We Need', 116, 11),
		('Water', 168, 11),
		('God Is', 203, 11),
		('Hands On', 203, 11),
		('Use This Gospel', 213, 11),
		('Jesus Is Lord', 49, 11),
		('Part 1', 1800, 12),
		('Part 2', 1900, 12),
		('Part 3', 2000, 12);
     
INSERT INTO Digests(title, issue_year)
     VALUES 
    	('The Best of Nirvana', '2000-01-01'),
		('The Best of Madonna', '2001-01-01'),
		('The Best of Classic', '2018-01-01'),
		('Slow music', '2019-01-01'),
		('Nice digest', '2020-01-01'),
		('The Best of The Doors', '2000-01-01'),
		('Top-20 in 2019', '2000-01-01'),
		('New Year songs', '2020-01-01');
    
INSERT INTO Jenres_Performers
     VALUES 
    	(1, 1),
		(2, 5),
		(3, 4),
		(4, 4),
		(5, 3),
		(6, 3),
		(7, 2),
		(8, 2),
		(9, 5),
		(7, 3);
     
INSERT INTO Performers_Albums 
     VALUES 
    	(1, 1),
		(1, 2),
		(1, 3),
		(4, 4),
		(4, 5),
		(5, 6),
		(3, 7),
		(3, 8),
		(1, 10),
		(9, 9),
		(9, 11),
		(6, 12),
		(2, 13),
		(7, 14),
		(8, 15);

INSERT INTO Digests_Tracks 
     VALUES 
    	(4, 1),
		(1, 1),
		(10, 1),
		(17, 1),
		(19, 1),
		(21, 2), 
		(23, 2),
		(24, 2),
		(25, 2),
		(26, 2);

    
/* Select-requests */
/* 1 */    
         SELECT j.title, COUNT(performer_id) FROM jenres_performers jp 
         LEFT JOIN jenres j ON jp.jenre_id = j.jenre_id 
       GROUP BY j.jenre_id;
      
/* 2 */  
         SELECT a.title, issue_year, COUNT(track_id) FROM tracks t 
      LEFT JOIN albums a ON t.album_id = a.album_id 
          WHERE issue_year >= '2019-01-01' AND issue_year <= '2020-01-01'   
       GROUP BY a.album_id;
      
/* 3 */      
         SELECT a.title, AVG(duration) FROM albums a 
      LEFT JOIN tracks t ON t.album_id = a.album_id 
       GROUP BY a.album_id;
      
/* 4 */  
SELECT title FROM performers p2 
WHERE not title = (SELECT DISTINCT p.title  FROM performers p 
		        FULL JOIN performers_albums pa ON p.performer_id = pa.performer_id 
		        FULL JOIN albums a ON pa.album_id = a.album_id
		            WHERE issue_year = '2020-01-01'
           		  );
     
/* 5 */  
SELECT DISTINCT d.title FROM digests d 
      LEFT JOIN digests_tracks dt ON d.digest_id = dt.digest_id 
      LEFT JOIN tracks t ON dt.track_id = t.track_id 
      LEFT JOIN albums a ON t.album_id = a.album_id 
      LEFT JOIN performers_albums pa ON a.album_id = pa.album_id 
      LEFT JOIN performers p ON pa.performer_id = p.performer_id 
          WHERE p.title = 'Madonna';
         
/* 6 */  
         SELECT a.title FROM albums a 
      LEFT JOIN performers_albums pa ON a.album_id = pa.album_id 
      LEFT JOIN performers p ON pa.performer_id = p.performer_id 
      LEFT JOIN jenres_performers jp ON p.performer_id = jp.performer_id 
      LEFT JOIN jenres j ON jp.jenre_id = j.jenre_id 
       GROUP BY a.title 
         HAVING COUNT(j.jenre_id)>1;
         
/* 7 */  
         SELECT t.title, digest_id FROM tracks t 
      LEFT JOIN digests_tracks dt ON t.track_id = dt.track_id 
          WHERE digest_id IS NULL;
         
/* 8 */  
SELECT DISTINCT p.title FROM tracks t 
      LEFT JOIN albums a ON t.album_id = a.album_id 
      LEFT JOIN performers_albums pa ON a.album_id = pa.album_id 
      LEFT JOIN performers p ON pa.performer_id = p.performer_id 
          WHERE t.duration = (SELECT MIN(duration) FROM tracks t);
         
/* 9 */  
SELECT DISTINCT a2.title, COUNT(a2.album_id) FROM albums a2 
      FULL JOIN tracks t2 ON t2.album_id = a2.album_id
       GROUP BY a2.title
         HAVING COUNT(a2.album_id) = (SELECT COUNT(a.album_id) FROM tracks t 
      			   	   			   LEFT JOIN albums a ON t.album_id = a.album_id 
      								GROUP BY a.title 
      								ORDER BY COUNT
       					 			   LIMIT 1);
   

