/* 
Constraints for Table Movie:
Every Movie is identified by a unique id
Every Movie must have a unique title which should not be null
*/
CREATE TABLE Movie (
id INT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
year INT,
rating VARCHAR(10),
company VARCHAR(50)
);

/* 
Constraints for Table Actor:
Every Actor is idntified by a unique id
Every Actor must have a date of birth
*/
CREATE TABLE Actor (
id INT PRIMARY KEY,
last VARCHAR(20),
first VARCHAR(20),
sex VARCHAR(6),
dob DATE NOT NULL,
dod DATE
);

/* 
Constraints for Table Sales:
Every sales should be of a particular movie in the Movie Table
*/
CREATE TABLE Sales (
mid INT,
ticketsSold INT,
totalIncome INT,
FOREIGN KEY (mid) references Movie(id)
) ENGINE=INNODB;

/*
Constraints for Table Director:
Every Director is identified by a unique id
Every Director must have a date of birth
*/
CREATE TABLE Director (
id INT PRIMARY KEY,
last VARCHAR(20),
first VARCHAR(20),
dob DATE NOT NULL,
dod DATE
);

/*
Constraints for Table MovieGenre:
Every tuple in MovieGenre Table should be of a particular movie in the Movie Table
*/
CREATE TABLE MovieGenre (
mid INT,
genre VARCHAR(20),
FOREIGN KEY (mid) references Movie(id)
) ENGINE=INNODB;

/*
Constraints for Table MovieDirector:
Every tuple should be a movie from the Movie table
Every tuple should be directed by a particular director from Director table
*/
CREATE TABLE MovieDirector (
mid INT,
did INT,
FOREIGN KEY (mid) references Movie(id),
FOREIGN KEY (did) references Director(id)
) ENGINE=INNODB;

/* 
Constraints for Table MovieActor:
Every tuple should be a movie from the Movie table
Every tuple should have a particular actor from the Actor table
*/
CREATE TABLE MovieActor (
mid INT,
aid INT,
role VARCHAR(50),
FOREIGN KEY (mid) references Movie(id),
FOREIGN KEY (aid) references Actor(id)
) ENGINE=INNODB;

/* 
Constraints for Table MovieRating:
Every tuple should be a movie from the Movie table
Check for imdb and rot ratings: should be between 0 - 100 (inclusive of both) 
*/
CREATE TABLE MovieRating (
mid INT,
imdb INT,
rot INT,
CHECK(imdb >= 0 AND imdb <=100),
CHECK(rot >= 0 AND rot <=100),
FOREIGN KEY (mid) references Movie(id)
) ENGINE=INNODB;

/* 
Constraints for Table Review:
Every tuple should be a movie from the Movie table
Check for rating: should be on a scale of 0 - 5
*/
CREATE TABLE Review (
name VARCHAR(20),
time TIMESTAMP,
mid INT,
rating INT,
comment VARCHAR(500),
CHECK(rating >= 0 AND rating <=5),
FOREIGN KEY (mid) references Movie(id)
) ENGINE=INNODB;

CREATE TABLE MaxPersonID (
id INT
);

CREATE TABLE MaxMovieID (
id INT
);