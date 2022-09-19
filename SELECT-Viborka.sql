--task 1
select name_album, year_release_album from album
where date(year_release_album) >= '2018-01-01' and date(year_release_album) <= '2018-12-31';

--task 2
select name_track, duration from track
order by duration desc
limit 1;

--task 3
select name_track from track
where duration >= '00:03:30';

--task 4
select name_collection from collection
where date(year_release_collection) >= '2018-01-01' and date(year_release_collection) <= '2020-12-31';

--task 5
select name_executor from executor
where name_executor not like '% %';


--task 6
select name_track from track
where name_track like '%My%';

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