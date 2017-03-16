use SpotifyDb;
/*Display all records from each table*/
SELECT * 
From Search_es
SELECT * 
From Songs
SELECT * 
From Albumns
SELECT * 
From Tours
SELECT * 
From User_s
SELECT * 
From Playlists
SELECT * 
From Artists
SELECT * 
From Payments

/*Aggregate Function: Number of songs in each genre  */
SELECT COUNT(Song_ID)as Number_of_Songs, Genre
FROM Songs
Group By Genre

/*InnerJoin: List all the songs in the album Cloud Nine*/
SELECT a.Album_Name, s.Name 
FROM Albums as a
INNER JOIN Songs as s
ON a.Artist_ID= s.Artist_ID
WHERE Album_Name='Cloud Nine' 
ORDER BY Name ASC;

/*FullOuterJoin: List all the albums by all the artists*/
SELECT ar.Artist_Title, ab.Album_Name
FROM Albums as ab
LEFT OUTER JOIN Artists as ar
ON ab.Artist_ID=ar.Artist_ID
ORDER BY Album_Name ASC;

/*Subquery: Count number of songs in the Tropicals House Playlist*/
SELECT Count(song_ID) as Number_of_Artists
From Songs
WHERE song_ID IN
(SELECT song_ID from Playlists
where Name_of_Playlist= 'Tropicals House');