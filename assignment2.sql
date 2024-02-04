CREATE TABLE Movies (
	MovieID INT AUTO_INCREMENT PRIMARY KEY,
    MovieName VARCHAR(50)
);

INSERT INTO Movies (MovieName) VALUES ('Saltburn'), ('Iron Claw'), ('Barbie'), ('Oppenheimer'), ('The Holdovers'), ('Maestro');

CREATE TABLE Friends (
	FriendID INT AUTO_INCREMENT PRIMARY KEY,
    FriendName VARCHAR(50)
);

INSERT INTO Friends (FriendName) VALUES ('Mike'), ('Sam'), ('Eli'), ('Dan'), ('Anton');

select * from friends;

#create third table to store movie ratings, using FriendID and MovieID as foreign keys from the respective tables
CREATE TABLE MovieRatings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    FriendID INT,
    MovieID INT,
    Rating INT,
    FOREIGN KEY (FriendID) REFERENCES Friends(FriendID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

#Mike ratings
INSERT INTO MovieRatings (FriendID, MovieID, Rating)
VALUES (1, 1, 4), (1, 2, 2), (1, 3, 5), (1, 4, 2), (1, 5, 2), (1, 6, 2);

#Sam ratings
INSERT INTO MovieRatings (FriendID, MovieID, Rating)
VALUES (2, 1, 4), (2, 2, NULL), (2, 3, 3), (2, 4, 4), (2, 5, 1), (2, 6, 4);

#Eli ratings
INSERT INTO MovieRatings (FriendID, MovieID, Rating)
VALUES (3, 1, NULL), (3, 2, 4), (3, 3, 5), (3, 4, 5), (3, 5, 2), (3, 6, 1);

#Dan ratings
INSERT INTO MovieRatings (FriendID, MovieID, Rating)
VALUES (4, 1, 2), (4, 2, 3), (4, 3, 5), (4, 4, 3), (4, 5, 4), (4, 6, NULL);

#Anton ratings
INSERT INTO MovieRatings (FriendID, MovieID, Rating)
VALUES (5, 1, 4), (5, 2, 2), (5, 3, 1), (5, 4, 2), (5, 5, 2), (5, 6, 3);


#query to view MovieRatings with the name of each movie and each friend
SELECT Friends.FriendName AS FriendName, Movies.MovieName AS MovieName, MovieRatings.Rating
FROM MovieRatings
JOIN Friends ON MovieRatings.FriendID = Friends.FriendID
JOIN Movies ON MovieRatings.MovieID = Movies.MovieID;
