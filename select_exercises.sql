use albums_db;
#3a How many rows are in the albums table?
select count(*) from albums; # returned 31

select * from albums; #jsut checking it out

#3b How many unique artist names are in the albums table?
select count(distinct(artist)) from albums; # returns 23
# 3c) What is the primary key for the albums table?  
# 3c Answer: id
#3d What is the oldest release date for any album in the albums table? What is the most recent release date?
select * from albums
where release_date = (select max(release_date) from albums); # returned id 18, 2011

select * from albums
where release_date = (select min(release_date) from albums); # returned id 15, 1967

#4a The name of all albums by Pink Floyd (is used 'name' as requested, if I wanted the entire entry returned, i would use '*')
select name from albums
where artist = 'Pink Floyd'; #returns the dark side of the moon adn the wall
#4b  The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band"; # returns 1967
#4c The genre for the album Nevermind
select genre from albums
where name = 'Nevermind'; # returns Grunge, Alternative
#4d Which albums were released in the 1990s
select name from albums
where release_date between 1990 and 1999;
#4e  Which albums had less than 20 million certified sales
select name from albums
where sales < 20; 
#4f All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
#4f Answer: Used "Rock" which is exact match. Need to use "%rock%" for wild card matches or use "like" function

#Rock
select * from albums
where genre = "Rock";

#Rock, rock variations
select * from albums
where genre like '%rock%';



