task1
�������� � ��� ������ ��������, �������� � 2018 ����

select name_album, year_release_album from album
where date(year_release_album) >= '2018-01-01' and date(year_release_album) <= '2018-12-31';

task2
�������� � ����������������� ������ ����������� �����;

select name_track, duration from track
order by duration desc
limit 1;


task3
�������� ������, ����������������� ������� �� ����� 3,5 ������;

select name_track from track
where duration >= '00:03:30';



task4
�������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������;

select name_collection from collection
where date(year_release_collection) >= '2018-01-01' and date(year_release_collection) <= '2020-12-31';

task5
�����������, ��� ��� ������� �� 1 �����;

select name_executor from executor
where name_executor not like '% %';


task6
�������� ������, ������� �������� ����� "���"/"my".

select name_track from track
where name_track like '%My%';