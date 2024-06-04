CREATE table if not EXISTS genres (
  genre_id SERIAL PRIMARY KEY,
  genre VARCHAR(50) NOT NULL
);
INSERT INTO genres (genre_id, genre) VALUES (1, 'Рок'), (2, 'Поп'), (3, 'Электронная музыка'), (4, 'Хип-хоп');
CREATE table if not EXISTS artists (
  artist_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  genres VARCHAR(200),
  genre INT REFERENCES genres(genre_id)
);
INSERT INTO artists (name, genre) values ('Linkin park', 1), ('Rihanna', 2), ('Dj Smash', 3), ('Eminem', 4);
CREATE TABLE IF NOT EXISTS albums (
  album_id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  year INT NOT NULL,
  artist INT REFERENCES artists(artist_id)
);
INSERT INTO albums (title, year, artist) VALUES ('Meteora', 2003, 1), ('Loud', 2010, 2), ('IDDQD', 2008, 3), ('Infinite', 1996, 4);

CREATE TABLE IF NOT EXISTS tracks (
  track_id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums(album_id),
  title VARCHAR(100) NOT NULL,
  length INT NOT NULL
);

CREATE TABLE compilations (
  compilation_id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  year INT NOT NULL,
  artist INT FOREIGN KEY REFERENCES artists(artist_id),
  genre INT FOREIGN KEY REFERENCES genres(genre_id)
);

