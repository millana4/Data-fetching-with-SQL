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
     VALUES ('Madonna');

INSERT INTO Performers(title)
     VALUES ('50cent');
	
INSERT INTO Performers(title)
     VALUES ('The Doors');
	
INSERT INTO Performers(title)
     VALUES ('Nirvana');
	
INSERT INTO Performers(title)
     VALUES ('Vivaldi');
	
INSERT INTO Performers(title)
     VALUES ('Tchaikovsky');
	
INSERT INTO Performers(title)
     VALUES ('Glenn Miller');
	
INSERT INTO Performers(title)
     VALUES ('Louis Armstrong');
	 
INSERT INTO Performers(title)
     VALUES ('Kanye West');
	
	
INSERT INTO Jenres(title)
     VALUES ('Pop music');

INSERT INTO Jenres(title)
     VALUES ('Jazz');

INSERT INTO Jenres(title)
     VALUES ('Classic');

INSERT INTO Jenres(title)
     VALUES ('Rock');

INSERT INTO Jenres(title)
     VALUES ('Rap');


INSERT INTO Albums(title, issue_year)
     VALUES ('Like a Prayer', '1989-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Erotica', '1992-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('American Life', '2003-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Nevermind', '1991-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Bleach', '1989-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('The four seasons', '1723-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Waiting for the Sun', '1968-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Strange Days', '1967-01-01');
    
INSERT INTO Albums(title, issue_year)
     VALUES ('Ye', '2018-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Madame X', '2019-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('Jesus Is King', '2019-01-01');
     
INSERT INTO Albums(title, issue_year)
     VALUES ('The Swan Lake', '2020-01-01');    
    
INSERT INTO Albums(title, issue_year)
     VALUES ('Curtis', '2007-01-01');    

INSERT INTO Albums(title, issue_year)
     VALUES ('Glenn Miller and His Orchestra', '1945-01-01');    

INSERT INTO Albums(title, issue_year)
     VALUES ('Louis Armstrong and His Friends', '1971-01-01');    

    
INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Smells Like Teen Spirit', 301, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('In Bloom', 254, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Come as You Are', 219, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Breed', 183, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Lithium', 257, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Polly', 177, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Territorial Pissings', 142, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Drain You', 223, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Lounge Act', 156, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Stay Away', 212, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('On a Plain', 196, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Something in the Way', 232, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Endless, Nameless', 403, 4);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Blew', 175, 5);
     
INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Floyd the Barber', 138, 5);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('About a Girl', 168, 5);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('School', 224, 5);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Can you feel my Love Buzz', 215, 5);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Paper Cuts', 244, 5);

INSERT INTO Tracks(title, duration, album_id)
     VALUES ('Negative Creep', 176, 5);
    
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Medellín', 298, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Dark Ballet"', 254, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('God Control', 379, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Future', 233, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Batuka', 297, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Killers Who Are Partying', 328, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Crave', 201, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Crazy', 242, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Come Alive', 242, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Faz Gostoso', 245, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Bitch Im Loca', 49, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('I Dont Search I Find', 248, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('I Rise', 244, 10);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Every Hour', 112, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Selah', 165, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Follow God', 104, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Closed on Sunday', 152, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('On God', 136, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Everything We Need', 116, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Water', 168, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('God Is', 203, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Hands On', 203, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Use This Gospel', 213, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Jesus Is Lord', 49, 11);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Part 1', 1800, 12);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Part 2', 1900, 12);
     
INSERT INTO tracks(title, duration, album_id)
     VALUES ('Part 3', 2000, 12);
     

INSERT INTO Digests(title, issue_year)
     VALUES ('The Best of Nirvana', '2000-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('The Best of Madonna', '2001-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('The Best of Classic', '2018-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('Slow music', '2019-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('Nice digest', '2020-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('The Best of The Doors', '2000-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('Top-20 in 2019', '2000-01-01');
     
INSERT INTO Digests(title, issue_year)
     VALUES ('New Year songs', '2020-01-01');
     

INSERT INTO Jenres_Performers
     VALUES (1, 1);
     
INSERT INTO Jenres_Performers
     VALUES (2, 5);
     
INSERT INTO Jenres_Performers
     VALUES (3, 4);
     
INSERT INTO Jenres_Performers
     VALUES (4, 4);
     
INSERT INTO Jenres_Performers
     VALUES (5, 3);
     
INSERT INTO Jenres_Performers
     VALUES (6, 3);
     
INSERT INTO Jenres_Performers
     VALUES (7, 2);
     
INSERT INTO Jenres_Performers
     VALUES (8, 2);
    
INSERT INTO Jenres_Performers
     VALUES (9, 5);
     
INSERT INTO Jenres_Performers
     VALUES (7, 3);
     
     
INSERT INTO Performers_Albums 
     VALUES (1, 1);
     
INSERT INTO Performers_Albums
     VALUES (1, 2);

INSERT INTO Performers_Albums
     VALUES (1, 3);

INSERT INTO Performers_Albums
     VALUES (4, 4);

INSERT INTO Performers_Albums
     VALUES (4, 5);

INSERT INTO Performers_Albums
     VALUES (5, 6);

INSERT INTO Performers_Albums
     VALUES (3, 7);
    
INSERT INTO Performers_Albums
     VALUES (3, 8);
    
INSERT INTO Performers_Albums
     VALUES (1, 10);
    
INSERT INTO Performers_Albums
     VALUES (9, 9);

INSERT INTO Performers_Albums
     VALUES (9, 11);
    
INSERT INTO Performers_Albums
     VALUES (6, 12);

INSERT INTO Performers_Albums
     VALUES (2, 13);

INSERT INTO Performers_Albums
     VALUES (7, 14);

INSERT INTO Performers_Albums
     VALUES (8, 15);

     
INSERT INTO Digests_Tracks 
     VALUES (4, 1);

INSERT INTO Digests_Tracks 
     VALUES (1, 1);

INSERT INTO Digests_Tracks 
     VALUES (10, 1);

INSERT INTO Digests_Tracks 
     VALUES (17, 1);

INSERT INTO Digests_Tracks 
     VALUES (19, 1);

INSERT INTO Digests_Tracks 
     VALUES (21, 2); 
    
INSERT INTO Digests_Tracks 
     VALUES (23, 2);
    
INSERT INTO Digests_Tracks 
     VALUES (24, 2);
    
INSERT INTO Digests_Tracks 
     VALUES (25, 2);
    
INSERT INTO Digests_Tracks 
     VALUES (26, 2);

    
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
         SELECT DISTINCT p.title  FROM performers p 
      FULL JOIN performers_albums pa ON p.performer_id = pa.performer_id 
      FULL JOIN albums a ON pa.album_id = a.album_id
      WHERE NOT issue_year = '2020-01-01';
     
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
         SELECT a.title, COUNT(a.album_id) FROM tracks t 
      LEFT JOIN albums a ON t.album_id = a.album_id 
       GROUP BY a.title 
       ORDER BY COUNT
          LIMIT 1;

