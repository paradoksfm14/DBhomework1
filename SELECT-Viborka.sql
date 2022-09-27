--task 1
SELECT g.name_genre, count(ge.id_executor) FROM genre g
JOIN  genre_executor ge ON g.uniqueid = ge.id_genre
GROUP BY g.name_genre;

--task 2
select a.name_album, a.year_release_album, count(t.uniqueid) FROM album a
JOIN track t ON a.uniqueid = t.id_album
WHERE date(a.year_release_album) >= '2019-01-01' AND date(a.year_release_album)  <= '2020-01-01'
GROUP BY a.name_album, a.year_release_album;

--task 3
SELECT  a.name_album, AVG(t.duration) FROM album a
JOIN track t ON a.uniqueid = t.id_album
GROUP BY a.name_album;

--task 4
SELECT e.name_executor, a.year_release_album FROM executor e
JOIN album_executor ae ON e.uniqueid = ae.id_executor
JOIN album a ON ae.id_album = a.uniqueid
WHERE date(a.year_release_album) <= '2020-01-01' and date(a.year_release_album) >= '2020-12-31';

--task 5
SELECT DISTINCT c.name_collection FROM collection c
JOIN collection_track ct ON c.uniqueid = ct.id_collection
JOIN track t ON ct.id_track = t.uniqueid
JOIN album a ON t.id_album = a.uniqueid
JOIN album_executor ae ON a.uniqueid = ae.id_album
JOIN executor e ON ae.id_executor = e.uniqueid
WHERE e.name_executor LIKE 'Drake';


--task 6
SELECT a.name_album FROM album a
JOIN album_executor ae ON a.uniqueid = ae.id_album
JOIN executor e ON ae.id_executor = e.uniqueid
JOIN genre_executor ge ON e.uniqueid = ge.id_executor
GROUP BY e.name_executor , a.name_album
HAVING count(ge.id_genre) > 1;

--task 7
select name_track from track as t
left join collection_track as ct on t.uniqueid = ct.id_track
where ct.id_track is null;

--task 8
select t.duration, e.name_executor, t.name_track from track as t
	left join album_executor as ae on t.id_album = ae.id_executor 
	left join executor as e on ae.id_executor = e.uniqueid 
	group by e.name_executor, t.name_track, t.duration
	having t.duration = (select min(duration) from track)
	order by e.name_executor;

--task 9
select a.name_album, count(t.uniqueid) from album as a
	join track as t on a.uniqueid = t.id_album
	group by a.name_album 
	having count(t.uniqueid) in (select count(t.uniqueid) from album a
		join track as t on a.uniqueid = t.id_album
		group by a.name_album
		order by count(t.uniqueid)
		limit 1
	)
;