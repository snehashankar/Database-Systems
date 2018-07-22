/* id is the primary key of Movie, hence cannot be null */
insert into Movie VALUES (\N, "XYZ", 2000, "4", "sneha&co");

/* id is the primary key of Actor; hence can't be duplicate */
insert into Actor VALUES (19, "Shankar", "Sneha", "FEMALE", 1993-09-24, \N);

/* dob is decalred as NOT NULL; Hence violates if null */
insert into Actor VALUES (68636, "Shankar", "Sneha", "FEMALE", \N, \N);

/* mid is Foreign Key of Sales which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into Sales VALUES (68636, 10000, 5000000);

/* id is the primary key of Director; hence can't be NULL */
insert into Director VALUES (\N, "Shankar", "Sneha", 1993-09-24, \N);

/* dob is declared as NOT NULL in Director; hence can't be NULL */
insert into Director VALUES (68636, "Shankar", "Sneha", \N, \N);

/* mid is Foreign Key of MovieGenre which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into MovieGenre VALUES (68636, "Romance");

/* mid is Foreign Key of MovieDirector which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into MovieDirector VALUES (68636, 2);

/* did is Foreign Key of MovieDirector which refers to id of Director; If there is no such id in the Director table, then insertion will lead to an error */
insert into MovieDirector VALUES (2, 600000);

/* aid is Foreign Key of MovieActor which refers to id of Actor; If there is no such id in the Actor table, then insertion will lead to an error */
insert into MovieActor VALUES (2, 600000, "sneha");

/* mid is Foreign Key of MovieDirector which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into MovieActor VALUES (68636,2, "sneha");

/* mid is Foreign Key of Movierating which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into MovieRating VALUES (68636, 2, 5);

/* imdb check violated since rating should be between 0 and 100 */
insert into MovieRating VALUES (2, 200, 5);

/* rot check violated since rating should be between 0 and 100 */
insert into MovieRating VALUES (2, 90, 106);

/* mid is Foreign Key of Review which refers to id of Movie; If there is no such id in the Movie table, then insertion will lead to an error */
insert into Review VALUES ("sneha", 987467329, 68636, 3, "Avg");

/* rating check violated since rating should be between 0 and 5 */
insert into Review VALUES ("sneha", 987467329, 2, 10, "Very good");