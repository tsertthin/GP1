CREATE DATABASE SpotifyDb;
GO

USE SpotifyDb;
Go
-- Create tables -- 
CREATE TABLE Songs(
  Song_ID bigint NOT NULL PRIMARY KEY,
  Artist_ID bigint NULL,
  Album_ID bigint NULL,
  Genre varchar(100) NULL,
  Name varchar(100) NULL,
  Number_of_Plays bigint NULL);

CREATE TABLE User_s(
  User_ID bigint NOT NULL PRIMARY KEY,
  First_Name varchar(100) NULL,
  Last_Name varchar(100) NULL,
  Username varchar(100) NULL,
  Email varchar(100) NULL,
  Age bigint NULL,
  Number_of_Artists_Following bigint NULL,
  Number_of_Playlists bigint NULL,
  Join_Date varchar(100) NULL,
  Membership_Type varchar(100) NULL);

CREATE TABLE Playlists(
  Playlist_ID bigint NOT NULL PRIMARY KEY,
  Song_ID bigint NULL,
  User_ID bigint NULL,
  Name_of_Playlist varchar(100) NULL,
  Number_of_Followers bigint NULL,
  Total_Length_of_Playlist bigint NULL,
  Number_of_Songs bigint NULL,
  Type_of_Playlist varchar(100) NULL);

CREATE TABLE Tours(
  Tour_ID bigint NOT NULL PRIMARY KEY,
  Artist_ID bigint NULL,
  Tour_Name varchar(100) NULL,
  Location varchar(100) NULL,
  Date bigint NULL,
  Time bigint NULL);

CREATE TABLE Artists(
  Artist_ID bigint NOT NULL PRIMARY KEY,
  Tour_ID bigint NULL,
  Artist_Title varchar(100) NULL,
  Country varchar(100) NULL,
  Number_of_Followers bigint NULL,
  Number_of_Total_Listeners bigint NULL);

CREATE TABLE Search_es(
  Search_ID bigint NOT NULL PRIMARY KEY,
  User_ID bigint NULL,
  Song_ID bigint NULL,
  Artist_ID bigint NULL,
  Date varchar(100) NULL,
  Time varchar(100) NULL,
  Is_Matched varchar(100) NULL);

CREATE TABLE Albums(
  Album_ID bigint NOT NULL PRIMARY KEY,
  Artist_ID bigint NULL,
  Album_Name varchar(100) NULL,
  Year_Published bigint NULL,
  Record_Label varchar(100) NULL,
  Number_of_Awards bigint NULL,
  Number_of_Songs_in_Album bigint NULL,
  Total_Length_of_Album bigint NULL);

CREATE TABLE Payments (
	Payment_ID bigint NOT NULL PRIMARY KEY,
  User_ID bigint NULL,
  Card_Type varchar(100) NULL,
  Card_Number bigint NULL);

ALTER TABLE Tour ADD CONSTRAINT FK_Tour_Artist
FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID)
GO

ALTER TABLE Song ADD CONSTRAINT FK_Song_Artist
  FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID)
  GO

ALTER TABLE Playlist ADD CONSTRAINT FK_Playlist_Song
FOREIGN KEY (Song_ID) REFERENCES Song(Song_ID)
GO

ALTER TABLE Payment ADD CONSTRAINT FK_Search_Payment
FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
GO

Insert Into Artists (Artist_ID, Tour_ID, Artist_Title, Country, Number_of_Followers, Number_of_Total_Listeners) VALUES
(029385, 105389, 'Kygo', 'Norway', 1331670, 28036285),
(029393, 102934, 'Coldplay', 'United Kingdom', 6910414, 33378781),
(029999, 109483, 'Kendrick Lamar', 'United States', 3311610, 9151411 ),
(021931, 102030, 'Ed Sheeran', 'United Kingdom', 8033827, 49081811),
(022222, 109304, 'Bruno Mars', 'United States', 5799502, 29716782),
(023333, 105555, 'Jack U', 'United States', 461351, 5539315 ),
(027182, 105678, 'Justin Bieber', 'Canada', 8393553, 19078830),
(028585, 104892, 'John Legend', 'United States', 1683962, 18072125),
(021234, 105928, 'Martin Garrix', 'Netherlands', 2176729, 27732532),
(021111, 101111, 'Shakira', 'Colombia', 2939410, 22559903);

Insert Into Tours(Tour_ID, Artist_ID, Tour_Name, Location, Date, Time) VALUES
(105389, 029385, 'Kygo', 'Norway', 1331670, 28036285),
(102934, 029393, 'Coldplay', 'United Kingdom', 6910414, 33378781),
(109483, 029999, 'Kendrick Lamar', 'United States', 3311610, 9151411 ),
(102030, 021931, 'Ed Sheeran', 'United Kingdom', 8033827, 49081811),
(109304, 022222, 'Bruno Mars', 'United States', 5799502, 29716782),
(105555, 023333, 'Jack U', 'United States', 461351, 5539315 ),
(105678, 027182, 'Justin Bieber', 'Canada', 8393553, 19078830),
(104892, 028585, 'John Legend', 'United States', 1683962, 18072125),
(105928, 021234, 'Martin Garrix', 'Netherlands', 2176729, 27732532),
(101111, 021111, 'Shakira', 'Colombia', 2939410, 22559903); 

INSERT INTO Playlists(Playlist_ID,Song_ID, User_ID, Name_of_Playlist, Number_of_Followers, Total_Length_of_Playlist, Number_of_Songs, Type_of_Playlist) VALUES
(456654, 689402, 105389, 'Tropical House',  2707496, 10, 5, 'Public'),
(432345, 683921, 102934, 'Tropicals House', 948535, 120, 20, 'Public'),
(876787, 687777, 102934, 'Alternatives', 3317929, 121, 31, 'Public'),
(234346, 681111, 102934, 'Pop Rocked', 1478066, 190, 28, 'Public'),
(654456, 680192, 109304, 'Popped', 8610295, 180, 24, 'Private'),
(234432, 685939, 109304, 'Poop', 7471308, 180, 40, 'Public'),
(432234, 680022, 109304, 'R&Bsta', 3938954, 27, 3, 'Public'),
(654486, 682233, 105678, 'Popsta', 9231493, 8, 2, 'Private'),
(735536, 689911, 105678, 'Rapstar', 4011624, 280, 30, 'Public'),
(136853, 689234, 105678, 'EDMer',012513, 480, 64, 'Public');
INSERT INTO User_s
(User_ID,First_Name,Last_Name,Username,Email,Age,Number_of_Artists_Following,Number_of_Playlists,Join_Date,Membership_Type) VALUES
(105389, 'Janice', 'Lee', 'JLEE', 'JLEE@YAHOO.COM', 20, 3, 4, '8/20/2012', 'PREMIUM'),
(102934, 'SUZE', 'LIPPIE', 'LIPPIELI', 'SLI@YAHOO.COM',22, 5, 6, '8/20/2012', 'PREMIUM'),
(109483, 'Shanice', 'Leet', 'JLEET', 'JLEETT@YAHOO.COM', 20, 3, 4, '8/20/2012', 'PREMIUM'),
(102030, 'Lanice', 'Leef', 'JLEEF', 'JLEEFF@YAHOO.COM', 20, 3, 4, '8/20/2012', 'PREMIUM'),
(109304, 'Kanice', 'Leeb', 'JLEEB', 'JLEEBB@YAHOO.COM', 20, 3, 4, '8/20/2012', 'FREE'),
(105555, 'Panice', 'Leesh', 'JLEESH', 'JLEESH@YAHOO.COM', 20, 3, 4, '8/20/2012', 'FREE'),
(105678, 'Wanice', 'Leed', 'JLEED', 'JLEEDD@YAHOO.COM', 20, 3, 4, '8/20/2012', 'FREE'),
(104892, 'Manice', 'Leeew', 'JLEEEW', 'JLEEWW@YAHOO.COM', 20, 3, 4, '8/20/2012', 'PREMIUM'),
(105928, 'QUanice', 'Leek', 'JLEEK', 'JLEEKK@YAHOO.COM', 20, 3, 4, '8/20/2012', 'PREMIUM'),
(101111, 'Canice', 'Leep', 'JLEEP', 'JLEEPP@YAHOO.COM', 20, 3, 4, '8/20/2012', 'FREE');


Insert Into Payments(Payment_ID, User_ID, Card_Type, Card_Number) VALUES
(0293005, 105389, 'Visa', 28036285774),
(0293004, 102934, 'Visa', 33378781774),
(0299004, 109483, 'Visa', 9151411774),
(0219004, 102030, 'MasterCard', 49081811774),
(0222004, 109304, 'MasterCard', 29716782744),
(0233004, 105555, 'MasterCard', 5539315744),
(0271004, 105678, 'Discover', 19078830844),
(0285004, 104892, 'Discover', 18072125844),
(0212004, 105928, 'Discover', 27732532448),
(0211004, 101111, 'Discover', 22559903848);

INSERT INTO Albums (Album_ID, Artist_ID, Album_Name, Year_Published, Record_Label, Number_of_Awards, Number_of_Songs_in_Album, Total_Length_of_Album) VALUES
(901923, 029385, 'Cloud Nine', 2016, 'Sony Music Entertainment International Ltd', 0, 15, 55),
(902222, 029393, 'Mylo Xyloto', 2011, 'Warner Music Group Company', 4, 14, 44),
(904568, 029999, 'To Pimp A Butterfly', 2015, 'Top Dawg Entertainment', 5, 16, 79),
(908192, 021931, 'Divide', 2017, 'Asylum Records UK', 2, 16, 59),
(908473, 022222, '24K Magic', 2016, 'Atlantic Recording Corp', 1, 9, 33),
(908888, 023333, 'Skrillex and Diplo present Jack U', 2015, 'Atlantic Recording Corporation', 3, 10, 35),
(908763, 027182, 'Purpose', 2015, 'Def Jam Recordings', 6, 19, 69),
(906543, 028585, 'Love In The Future', 2013, 'Sony Music Entertainment', 2, 20, 67),
(905555, 021234, 'Seven', 2016, 'STMPD RCRDS B.V.', 0, 7, 24),
(290444, 021111, 'Shakira.', 2014, 'Ace Entertainment', 0, 15, 51);

INSERT INTO Songs (Song_ID, Artist_ID, Album_ID, Genre, Name, Number_of_Plays) VALUES
(689402, 029385, 901923, 'Tropical House', 'Firestone', 492707496),
(683921, 029385, 901923, 'Tropical House', 'Carry Me', 54948535),
(687777, 029393, 902222, 'Alternative', 'Adventure Of A Lifetime', 353317929),
(681111, 029999, 908192, 'Pop Rock', 'Shape of You', 531478066),
(680192, 027182, 908763, 'Pop', 'Sorry', 838610295),
(685939, 027182, 908763, 'Pop', 'Company', 207471308),
(680022, 028585, 906543, 'R&B', 'All of Me', 553938954),
(682233, 022222, 908473, 'Pop', 'Thats What I Like', 119231493),
(689911, 029999, 904568, 'Rap', 'Alright', 104011624),
(689234, 021234, 905555, 'EDM', 'Sun Is Never Going Down', 12012513);

INSERT INTO Search_es (Search_ID, User_ID, Song_ID, Artist_ID, Date, Time, Is_Matched) VALUES
(771094, 105389, 689402, 029385, '3/16/2017', '6:00pm', 'Yes'),
(778392, 105389, 680000, 029999, '2/13/2016', '12:00am', 'No'),
(779292, 105389, 681111, 021931, '7/28/2016', '2:30pm', 'Yes'),
(771122, 105389, 682233, 022222, '1/20/2017', '6:35pm', 'Yes'),
(779910, 105389, 682233, 022222, '2/13/2016', '7:30am', 'Yes'),
(778223, 105389, 680192, 027182, '10/14/2016', '9:00am', 'Yes'),
(773458, 105389, 685939, 027182, '9/2/2016', '10:00am', 'Yes'),
(779900, 105389, 688888, 021931, '8/17/2016', '11:30am', 'No'),
(776556, 105389, 682222, 021212, '2/2/2017', '5:00pm', 'No'),
(770093, 105389, 689911, 029999, '1/1/2017', '12:01am', 'Yes');