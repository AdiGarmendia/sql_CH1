-- SELECT* From Song;

-- SELECT Title, ReleaseDate from Song
-- WHERE ArtistId = 6;

-- SELECT Title, ReleaseDate from Song
-- WHERE ArtistId = 6
-- and Title LIKE "G%";

-- SELECT count() as 'total songs' from Song;

-- SELECT count() as 'Songs With G' from Song
-- WHERE Title Like "%G%";

-- Add to the database
-- INSERT into Song
-- (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
-- Values ("Let's Dance Like Idiots", 34, "03/042005", 1, 3, 6);

-- More complex add
-- insert into Song
-- (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
-- SELECT "Let's Dance Like Idiots", 34, "03/04/2005", Genre.GenreId, Artist.ArtistId, Album.AlbumId
-- FROM Genre, Artist, Album
-- WHERE Genre.Label = "Rock"
-- and
-- Artist.ArtistName LIKE "%Beatles%"
-- and
-- Album.Title = "Revolver";

-- joined TABLE
-- SELECT song.title as 'song title', 
-- album.title
-- as 'album title', ArtistName
-- from Song
-- JOIN Album
-- ON song.AlbumId = album.AlbumId
-- JOIN Artist
-- ON song.ArtistId = Artist.ArtistId;

-- SELECT COUNT() as 'song total', album.title
-- FROM Song
-- Join Album ON song.AlbumId = album.AlbumId
-- GROUP BY song.AlbumId;

-- -- update
-- UPDATE Song
-- SET Title = 'I Need You Tomorrow'
-- WHERE SongId = 11;

-- -- delete
-- DELETE FROM Song
-- WHERE SongId = 9;

-- Query all of the entries in the Genre table
SELECT * FROM Genre;

-- Using the INSERT statement, 
-- add one of your favorite artists to the Artist table.
INSERT into Artist (ArtistName, YearEstablished)
VALUES ("James Blake", 2009);

-- Using the INSERT statement, add one, or more, 
-- albums by your artist to the Album table.

INSERT into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Assume Form", "01/18/2019", 2001, "Polydor Records", 29, 14);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Mile High", 235, "01/18/2019", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Electronic"
and
Artist.ArtistName LIKE "%James Blake%"
and
Album.Title = "Assume Form";

insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Power On", 285, "01/18/2019", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Electronic"
and
Artist.ArtistName LIKE "%James Blake%"
and
Album.Title = "Assume Form";

insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Barefoot In The Park", 235, "01/18/2019", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Electronic"
and
Artist.ArtistName LIKE "%James Blake%"
and
Album.Title = "Assume Form";

insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Mile High", 235, "01/18/2019", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Electronic"
and
Artist.ArtistName LIKE "%James Blake%"
and
Album.Title = "Assume Form";

-- Write a SELECT query that provides the song titles, 
-- album title, and artist name for all of the data you just entered in. 
SELECT song.title as 'song title', album.title as 'album title', ArtistName
FROM Song
JOIN Album ON song.AlbumId = album.AlbumId
JOIN Artist ON song.ArtistId = Artist.ArtistId
Where Song.ArtistId = 29;

-- Write a SELECT statement to display how many songs exist for each album. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT() as 'song total', album.title
FROM Song
JOIN Album on song.AlbumId = album.AlbumId
GROUP BY song.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT() as 'Song Total', artist.ArtistName
FROM Song
Join Artist on song.ArtistId = artist.ArtistId
GROUP BY song.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as 'Song Total', genre.Label
From Song
JOIN Genre on song.GenreId = Genre.GenreId
GROUP BY song.GenreId;

-- Using MAX() function, write a select statement to find the album with the 
-- longest duration. The result should display the album title and the duration.
SELECT Max(AlbumLength) AS "Longest Album", album.title
from Album;

-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.
SELECT Max(SongLength) AS "Longest Song", song.title
from Song;

-- Modify the previous query to also display the title of the album.
SELECT Max(SongLength) AS "Longest Song", song.title, album.title
from Song
JOIN Album on song.AlbumId = album.AlbumId;