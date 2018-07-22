select CONCAT(first,' ',last) as FullName from Actor where id in (Select aid from MovieActor where mid = (Select id from Movie where title = 'Death to Smoochy'));

select count(first) as DirectorCount from Director where id in (select did from MovieDirector group by did having count(did) > 4);

/* Give me the names of all movies who have both imbd and rot rating greater than 95 */
select title from Movie where id IN (Select mid from MovieRating where imdb > 95 and rot > 95);

/* Give the name of the movie having the maximum income */
select title from Movie where id = (Select mid from Sales where totalIncome = (Select max(totalIncome) from Sales));

/* Give count of all actors who have directed their own movie */
Select count(aid) as CountActor from MovieActor, MovieDirector where MovieActor.mid = MovieDirector.mid and MovieActor.aid = MovieDirector.did;