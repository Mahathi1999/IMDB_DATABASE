-- Create the Movie table
CREATE TABLE Movie (
  movie_id INT PRIMARY KEY,
  title VARCHAR(255),
  release_date DATE,
  duration INT
);

-- Create the Media table
CREATE TABLE Media (
  media_id INT PRIMARY KEY,
  movie_id INT,
  type ENUM('Video', 'Image'),
  url VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Create the Genre table
CREATE TABLE Genre (
  genre_id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the Movie_Genre table
CREATE TABLE Movie_Genre (
  movie_id INT,
  genre_id INT,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
  PRIMARY KEY (movie_id, genre_id)
);

-- Create the Review table
CREATE TABLE Review (
  review_id INT PRIMARY KEY,
  movie_id INT,
  user_id INT,
  rating DECIMAL(2, 1),
  comment VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the User table
CREATE TABLE User (
  user_id INT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255)
);

-- Create the Artist table
CREATE TABLE Artist (
  artist_id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the Skill table
CREATE TABLE Skill (
  skill_id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the Artist_Skill table
CREATE TABLE Artist_Skill (
  artist_id INT,
  skill_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (skill_id) REFERENCES Skill(skill_id),
  PRIMARY KEY (artist_id, skill_id)
);

-- Create the Role table
CREATE TABLE Role (
  role_id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the Film_Cast table
CREATE TABLE Film_Cast (
  movie_id INT,
  artist_id INT,
  role_id INT,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id),
  PRIMARY KEY (movie_id, artist_id, role_id)
);
