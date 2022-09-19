create table if not exists genre(
	UniqueID serial primary key,
	name_genre varchar(60)
);

create table if not exists collection(
	UniqueID serial primary key,
	name_collection varchar(60),
	year_release_collection date
);

create table if not exists album(
	UniqueID serial primary key,
	name_album varchar(60),
	year_release_album date
);

create table if not exists executor(
	UniqueID serial primary key,
	name_executor varchar(60)
);

create table if not exists track(
	UniqueID serial primary key,
	name_track varchar(60),
	duration time,
	id_album integer references album(UniqueID)
);

create table if not exists album_executor(
	id_executor integer references executor(UniqueID),
	id_album integer references album(UniqueID)
);

create table if not exists genre_executor(
	id_executor integer references executor(UniqueID),
	id_genre integer references genre(UniqueID)
);

create table if not exists collection_track(
	id_collection integer references collection(UniqueID),
	id_track integer references track(UniqueID)
);
