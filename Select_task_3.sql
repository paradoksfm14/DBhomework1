task1
название и год выхода альбомов, вышедших в 2018 году

select name_album, year_release_album from album
where date(year_release_album) >= '2018-01-01' and date(year_release_album) <= '2018-12-31';

task2
название и продолжительность самого длительного трека;

select name_track, duration from track
order by duration desc
limit 1;


task3
название треков, продолжительность которых не менее 3,5 минуты;

select name_track from track
where duration >= '00:03:30';



task4
названия сборников, вышедших в период с 2018 по 2020 год включительно;

select name_collection from collection
where date(year_release_collection) >= '2018-01-01' and date(year_release_collection) <= '2020-12-31';

task5
исполнители, чье имя состоит из 1 слова;

select name_executor from executor
where name_executor not like '% %';


task6
название треков, которые содержат слово "мой"/"my".

select name_track from track
where name_track like '%My%';