DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    title text NOT NULL
);

CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    title text NOT NULL,
    length TIME
);

CREATE TABLE albums_tracks(
    album_id integer REFERENCES albums(album_id),
    track_id integer REFERENCES tracks(track_id)
);

INSERT INTO albums(title)
VALUES  ('Lets Do it'),
        ('Breaking Bread'),
        ('Fourth Dimension'),
        ('Battle Grounds'),
        ('Battleborn'),
        ('New Dimension'),
        ('Game On'),
        ('Focus'),
        ('Damage Control'),
        ('Nine Yards');

INSERT INTO tracks(title,length)
VALUES  ('I Hope youre a player', '00:3:15'),
        ('He knows im a gold digger','00:2:35'),
        ('Catalyst','00:4:23'),
        ('Cool and Dangerous','00:4:00'),
        ('New Kind of Mind','00:3:15'),
        ('Body of Time','00:3:20'),
        ('Flavor for Freedom','00:4:25'),
        ('Bomberman','00:3:16'),
        ('No and Control','00:4:35'),
        ('Bless the Broken Road','00:3:55'),
        ('When can i see you again?','00:4:45'),
        ('Ready or Not','00:3:30'),
        ('Toy Soldier','00:4:14'),
        ('Church','00:3:25'),
        ('Enemy','4:20');

INSERT INTO albums_tracks(album_id, track_id)
VALUES  (1,11),
        (2,14),
        (3,5),
        (3,6),
        (4,7),
        (4,15),
        (5,8),
        (5,13),
        (5,15),
        (6,3),
        (6,5),
        (7,2),
        (7,4),
        (7,12),
        (8,9),
        (8,13),
        (9,1),
        (9,9),
        (10,10),
        (10,12);

SELECT A.title AS "Album Name", T.title AS "Song Name"
FROM albums AS A
INNER JOIN albums_tracks AS ABT
ON A.album_id = ABT.album_id
INNER JOIN tracks AS T
ON T.track_id = ABT.track_id
ORDER BY A.title;

SELECT T.title AS "Song Name", T.length, A.title
FROM tracks AS T
INNER JOIN albums_tracks AS ABT
ON T.track_id = ABT.track_id
INNER JOIN albums AS A
ON A.album_id = ABT.album_id
ORDER BY T.title;

SELECT A.title AS "Albums", COUNT(T.title)
FROM Albums AS A
INNER JOIN albums_tracks AS ABT
ON A.album_id = ABT.album_id
INNER JOIN tracks AS T
ON T.track_id = ABT.track_id
GROUP BY A.title;

SELECT T.title AS "Songs", COUNT(A.title)
FROM tracks AS T
INNER JOIN albums_tracks AS ABT
ON T.track_id = ABT.track_id
INNER JOIN albums AS A
ON A.album_id = ABT.album_id
GROUP BY T.title;