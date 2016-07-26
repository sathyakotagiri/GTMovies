/**
updated Jul 19, 2016
*/

/*
  direction to use with hashing passwords:

  1) drop all tables if exist
  2) create a user table and user category
  3) go to app and make the first user
  4) select * from user
  5) copy that password
  6) replace that password for everyone in the preset db
  7) Copy and paste every table after the USER TABLE
 */


USE cs44002;

DROP TABLE IF EXISTS SYSTEM_INFO;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS PLAYS_AT;
DROP TABLE IF EXISTS ORDER_ITEMS;
DROP TABLE IF EXISTS PREFERS;
DROP TABLE IF EXISTS CARD_INFO;
DROP TABLE IF EXISTS SHOW_TIME;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS THEATER;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS USER_CATEGORY;

/**
  System Info holds information that system needs such as ticket price.
 */
CREATE TABLE SYSTEM_INFO (
  Man_Pass     CHAR(60) NOT NULL UNIQUE,
  Refund_Price DOUBLE,
  Child_Disc   DOUBLE   NOT NULL UNIQUE,
  Senior_Disc  DOUBLE   NOT NULL UNIQUE,
  Ticket_Price DOUBLE   NOT NULL UNIQUE,
  PRIMARY KEY (Refund_Price)
);

/*
  Types of users defined.
 */
CREATE TABLE USER_CATEGORY (
  User_Type      INTEGER,
  User_Type_Name VARCHAR(20) NOT NULL,
  PRIMARY KEY (User_Type)
);

INSERT INTO USER_CATEGORY VALUES (0, 'customer');
INSERT INTO USER_CATEGORY VALUES (1, 'manager');

/*
  Users table
 */
CREATE TABLE USER (
  Username  VARCHAR(20),
  Password  CHAR(60)    NOT NULL,
  Email     VARCHAR(30) NOT NULL UNIQUE,
  User_Type INTEGER     NOT NULL DEFAULT 0,
  PRIMARY KEY (Username),
  FOREIGN KEY (User_Type) REFERENCES USER_CATEGORY (User_Type)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/**
  ---------------------------------------------------------------------------------------------------------------------
  WARNING: THE CODES BELOW WILL  NOT WORK FULLY IF YOU DONT FOLLOW HEADER INSTRUCTIONS.
 */

/*
select * FROM USER;
 */

INSERT INTO SYSTEM_INFO
VALUES ('$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 5.00, .3, .2, 13.25);

/*
  Populating user data
 */
INSERT INTO USER
VALUES ('user1', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user1@gatech.edu', 1);
INSERT INTO USER VALUES ('user2', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user2@gatech.ed', 1);
INSERT INTO USER VALUES ('user3', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user3@gmail.com', 1);
INSERT INTO USER VALUES ('user4', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user4@gmail.com', 1);
INSERT INTO USER VALUES ('user5', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user5@gmail.com', 1);
INSERT INTO USER VALUES ('user6', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user6@gmail.com', 0);
INSERT INTO USER VALUES ('user7', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user7@gmail.com', 0);
INSERT INTO USER VALUES ('user8', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user8@gmail.com', 0);
INSERT INTO USER VALUES ('user9', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user9@gmail.com', 0);
INSERT INTO USER VALUES ('user10', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user10@gmail.com', 0);
INSERT INTO USER VALUES ('user11', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user11@gatech.edu', 0);
INSERT INTO USER VALUES ('user12', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user12@gatech.edu', 0);
INSERT INTO USER VALUES ('user13', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user13@gatech.edu', 0);
INSERT INTO USER VALUES ('user14', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user14@gatech.edu', 0);
INSERT INTO USER VALUES ('user15', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user15@gatech.edu', 0);
INSERT INTO USER VALUES ('user16', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user16@gatech.edu', 0);
INSERT INTO USER VALUES ('user17', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user17@gatech.edu', 0);
INSERT INTO USER VALUES ('user18', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user18@gatech.edu', 0);
INSERT INTO USER VALUES ('user19', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user19@gatech.edu', 0);
INSERT INTO USER VALUES ('user20', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user20@gatech.edu', 0);
INSERT INTO USER VALUES ('user21', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user21@gatech.edu', 0);
INSERT INTO USER VALUES ('user22', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user22@gatech.edu', 0);
INSERT INTO USER VALUES ('user23', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user23@gatech.edu', 0);
INSERT INTO USER VALUES ('user24', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user24@gatech.edu', 0);
INSERT INTO USER VALUES ('user25', '$2a$10$nwgGdgRJXApNEctJfiYa2OhPM02SKHUwyvf9d62qADiz7Sl0WG1Hu', 'user25@gatech.edu', 0);


/*
  Table for movie
 */
CREATE TABLE MOVIE (
  Title           VARCHAR(120),
  Genre           VARCHAR(120)  NOT NULL,
  Length          INTEGER       NOT NULL,
  Audience_Rating INTEGER       NOT NULL,
  CHECK (Audience_Rating >= 1 AND Audience_Rating <= 5),
  Plot_Summary    VARCHAR(1000) NOT NULL,
  Release_Date    DATE          NOT NULL,
  Cast            VARCHAR(300)  NOT NULL,
  PRIMARY KEY (Title)
);

/*
  Populating movie data
 */
INSERT INTO MOVIE VALUES ('Finding Dory', 'Animation, Adventure, Comedy, Family', 97, 2,
                          'The friendly-but-forgetful blue tang fish begins a search for her long-lost parents, and everyone learns a few things about the real meaning of family along the way.',
                          '2016-06-17', 'Ellen DeGeneres, Albert Brooks, Ed O''Neill, Kaitlin Olson');
INSERT INTO MOVIE VALUES ('The Secret Life of Pets', 'Action, Comedy, Family', 90, 2,
                          'A terrier named Max regularly invites his friends to hang out at his place while his owner is gone, but his quiet life is upended when said owner also takes in Duke, a stray mutt whom Max instantly dislikes.',
                          '2016-07-08', 'Jenny Slate, Kevin Hart, Albert Brooks, Ellie Kemper!');
INSERT INTO MOVIE VALUES ('Captain Fantastic', 'Drama', 118, 4,
                          'In the forests of the Pacific Northwest, a father devoted to raising his six kids with a rigorous physical and intellectual education is forced to leave his paradise and enter the world, challenging his idea of what it means to be a parent.',
                          '2016-07-08', 'Viggo Mortensen, Frank Langella, Kathryn Hahn, George MacKay.');
INSERT INTO MOVIE VALUES ('Our Little Sister', 'Comedy, Drama', 128, 2,
                          'After the death of their estranged father, three siblings (Haruka Ayase, Masami Nagasawa, Kaho) invite their half sister (Suzu Hirose) to live with them.',
                          '2016-07-08',
                          'Haruka Ayase, Masami Nagasawa, Kaho, Suzu Hirose');
INSERT INTO MOVIE VALUES ('The Legend of Tarzan', 'Action, Adventure', 110, 4,
                          'Tarzan, having acclimated to life in London, is called back to his former home in the jungle to investigate the activities at a mining encampment.',
                          '2016-07-04', 'Alexander Skarsgård, Rory J. Saper, Christian Stevens, Christoph Waltz');
INSERT INTO MOVIE VALUES ('The Purge: Election Year', 'Sci-Fi, Thriller', 105, 3,
                          'Years after sparing the man who killed his son, former police sergeant Barnes has become head of security for Senator Charlie Roan, a Presidential candidate targeted for death on Purge night due to her vow to eliminate the Purge.',
                          '2016-07-04', 'Frank Grillo, Elizabeth Mitchell, Mykelti Williamson, Joseph Julian Soria');
INSERT INTO MOVIE VALUES ('The BFG', 'Adventure, Family, Fantasy', 117, 2,
                          'A girl named Sophie encounters the Big Friendly Giant who, despite his intimidating appearance, turns out to be a kindhearted soul who is considered an outcast by the other giants because, unlike them, he refuses to eat children.',
                          '2016-07-04', 'Mark Rylance, Ruby Barnhill, Penelope Wilton, Jemaine Clement');
INSERT INTO MOVIE VALUES ('Independence Day: Resurgence (2016)', 'Action, Adventure, Sci-Fi', 120, 3,
                          'Two decades after the first Independence Day invasion, Earth is faced with a new extra-Solar threat. But will mankind''s new space defenses be enough?',
                          '2016-07-04', 'Liam Hemsworth, Jeff Goldblum, Bill Pullman, Maika Monroe');
INSERT INTO MOVIE VALUES ('The Shallows', 'Drama, Horror, Thriller', 86, 3,
                          'A mere 200 yards from shore, surfer Nancy is attacked by a great white shark, with her short journey to safety becoming the ultimate contest of wills.',
                          '2016-07-04', 'Blake Lively, Óscar Jaenada, Angelo Jose, Lozano Corzo');
INSERT INTO MOVIE VALUES ('Now You See Me 2', 'Action, Adventure, Comedy, Crime, Mystery', 129, 3,
                          'The Four Horsemen resurface and are forcibly recruited by a tech genius to pull off their most impossible heist yet.',
                          '2016-07-04', 'Jesse Eisenberg, Mark Ruffalo, Woody Harrelson, Dave Franco');

/*
  5 Movies not not playing in theater. Event 'update_plays_at_show_time'
  will update the tables  once released date is reached.
 */

INSERT INTO MOVIE VALUE ('Star Trek Beyond (2016)', 'Action, Adventure, Sci-Fi, Thriller', 120, 2,
                         'The USS Enterprise crew explores the furthest reaches of uncharted space, where they encounter a new ruthless enemy who puts them and everything the Federation stands for to the test.',
                         '2018-07-22', 'Chris Pine, Zachary Quinto, Karl Urban, Zoe Saldana');
INSERT INTO MOVIE VALUE ('Ice Age: Collision Course (2016)', 'Animation, Adventure, Comedy, Family', 94, 2,
                         'Manny, Diego, and Sid join up with Buck to fend off a meteor strike that would destroy the world.',
                         '2016-07-22', 'Stephanie Beatriz, Robert Cardone, Neil deGrasse Tyson, Adam Devine');
INSERT INTO MOVIE VALUE ('Jason Bourne 2016', 'Action, Thriller', 123, 3,
                         'Jason Bourne, now remembering who he truly is, tries to uncover hidden truths about his past.',
                         '2016-07-29', ' Matt Damon, Tommy Lee Jones, Alicia Vikander, Vincent Cassel');
INSERT INTO MOVIE VALUE ('Bad Moms', 'Comedy', 101, 4,
                         'When three overworked and under-appreciated moms are pushed beyond their limits, they ditch their conventional responsibilities for a jolt of long overdue freedom, fun, and comedic self-indulgence.',
                         '2016-07-29', 'Mila Kunis, Kathryn Hahn, Kristen Bell, Christina Applegate');
INSERT INTO MOVIE VALUES ('Suicide Squad', 'Action, Crime, Fantasy, Sci-Fi, Thriller', 130, 3,
                          'A secret government agency recruits imprisoned supervillains to execute dangerous black ops missions in exchange for clemency.',
                          '2016-08-05',
                          'Margot Robbie, Cara Delevingne, Will Smith, Ben Affleck');
INSERT INTO MOVIE VALUES ('Nine Lives', 'Comedy, Family, Fantasy', 87, 2,
                          'A stuffy businessman finds himself trapped inside the body of his family''s cat.',
                          '2016-08-05', 'Kevin Spacey, Jennifer Garner, Robbie Amell, Christopher Walken');
INSERT INTO MOVIE VALUES ('The Space Between Us', 'Adventure, Drama, Romance, Sci-Fi', 113, 2,
                          'A young man raised by scientists on Mars returns to Earth to find his father.',
                          '2016-08-18',
                          'Carla Gugino, Britt Robertson, Gary Oldman, Asa Butterfield');
INSERT INTO MOVIE VALUES ('Ben-Hur', 'Adventure, Drama, History', 128, 2,
                          'A falsely accused Jewish nobleman survives years of slavery to take vengeance on his Roman best friend, who betrayed him.',
                          '2016-08-18', 'Jack Huston, Nazanin Boniadi, Ayelet Zurer, Sofia Black-D''Elia');
INSERT INTO MOVIE VALUES ('Mechanic: Resurrection (2016)', 'Action, Crime, Thriller', 134, 2,
                          'Arthur Bishop thought he had put his murderous past behind him when his most formidable foe kidnaps the love of his life. Now he is forced to travel the globe to complete three impossible assassinations, and do what he does best, make them look like accidents.',
                          '2016-08-26',
                          'Jason Statham, Jessica Alba, Michelle Yeoh, Tommy Lee Jones');

/**
  Table for theater
 */
CREATE TABLE THEATER (
  Theater_ID INTEGER AUTO_INCREMENT,
  Name       VARCHAR(40) NOT NULL,
  Street     VARCHAR(30) NOT NULL,
  City       VARCHAR(30) NOT NULL,
  State      CHAR(2)     NOT NULL,
  Zip        CHAR(6)     NOT NULL,
  PRIMARY KEY (Theater_ID)
);

INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('The Fox Theatre', '660 Peachtree St. NE', 'ATLANTA', 'GA', '30308');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('Alliance Theatre', '1280 Peachtree St. NE', 'ATLANTA', 'GA', '30309');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('Plaza Theatre', '1049 Ponce De Leon Ave NE', 'ATLANTA', 'GA', '30306');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('Phipps Plaza', '3500 Peachtree Rd NE', 'ATLANTA', 'GA', '30326');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('Midtown Promenade', '931 Monroe Dr NE', 'ATLANTA', 'GA', '30308');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('AMC DINE-IN Theatres Buckhead 6', '3340 Peachtree Rd NE', 'ATLANTA', 'GA', '30326');

/**
  For testing if search by state/city works
 */
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('New Amsterdam Theatre', 'W 42nd St', 'New York', 'NY', '10036');
INSERT INTO THEATER (Name, Street, City, State, Zip)
VALUES ('Century Hilltop 16', '3200 Klose Way', 'Richmond', 'CA', '94806');


/*
  When user saves a card, it goes into card_info
 */
CREATE TABLE CARD_INFO (
  Card_Num CHAR(16),
  Exp_Date DATE        NOT NULL,
  CHECK (Exp_Date > curdate()),
  CH_Lname VARCHAR(20) NOT NULL,
  CH_Fname VARCHAR(20) NOT NULL,
  Username VARCHAR(20) NOT NULL,
  CVV      CHAR(3)     NOT NULL,
  Saved    BOOLEAN     NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Card_Num),
  FOREIGN KEY (Username) REFERENCES USER (Username)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*
  users 1 - 5 do not have a card saved
  users 6 - 10 have just 1 credit card saved
 */
INSERT INTO CARD_INFO VALUES ('4716211661228619', '2017-12-05', 'doe', 'jane', 'user6', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('4916350883570529', '2018-10-01', 'smith', 'john', 'user7', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('4556485200573817', '2019-04-13', 'derrick', 'hicks', 'user8', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('4929897020828157', '2019-08-31', 'campbell', 'rudy', 'user9', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('4532036212121779', '2020-09-04', 'sheri', 'pena', 'user10', '233', TRUE);

/*
  users 11 - 15 have 2 or more credit card saved
 */
INSERT INTO CARD_INFO VALUES ('5139458838530551', '2017-07-14', 'Eduardo', 'Bryan', 'user11', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('5399695808978063', '2018-03-18', 'Eduardo', 'Bryan', 'user11', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('5449004389728809', '2020-09-04', 'Silva', 'Frances', 'user12', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('5196806190658511', '2020-03-07', 'Silva', 'Frances', 'user12', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('5530776198357173', '2020-11-27', 'Soto', 'Orlando', 'user13', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('6011322064497201', '2017-09-27', 'Soto', 'Orlando', 'user13', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('6011772325452306', '2020-06-06', 'Soto', 'Orlando', 'user13', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('6011900945473937', '2018-01-21', 'Horton', 'Jimmy', 'user14', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('6011940668105126', '2020-01-31', 'Horton', 'Jimmy', 'user14', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('347963302639878', '2016-10-25', 'Osborne', 'Edward', 'user15', '233', TRUE);
INSERT INTO CARD_INFO VALUES ('374220663699439', '2020-08-13', 'Osborne', 'Edward', 'user15', '233', TRUE);

CREATE TABLE REVIEW (
  Title       VARCHAR(60)  NOT NULL,
  Comment     VARCHAR(300),
  Username    VARCHAR(20)  NOT NULL,
  Movie_Title VARCHAR(120) NOT NULL,
  Rating      INTEGER      NOT NULL,
  CHECK (Rating >= 1 AND Rating <= 5),
  PRIMARY KEY (Username, Movie_Title),
  FOREIGN KEY (Username) REFERENCES USER (Username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  ,
  FOREIGN KEY (Movie_Title) REFERENCES MOVIE (Title)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/**
  Populating review data
 */
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Captain Fantastic is so lovely', 'Great family movie!', 'user6', 'Captain Fantastic', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Typical', 'Nothing we have not seen before', 'user7', 'Captain Fantastic', 3);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Too long and not worth watching', 'I did not like it', 'user8', 'Captain Fantastic', 2);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Our family loved it!', 'Great family movie!', 'user6', 'Finding Dory', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Good but not great', 'As title said, I think the movie was okay', 'user7', 'Finding Dory', 4);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', '', 'user8', 'Finding Dory', 3);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user12', 'Independence Day: Resurgence (2016)', 4);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES
  ('Good but not great', 'As title said, I think the movie was okay', 'user7', 'Independence Day: Resurgence (2016)',
   3);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user13', 'Independence Day: Resurgence (2016)', 3);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user12', 'Now You See Me 2', 3);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Good but not great', 'As title said, I think the movie was okay', 'user7', 'Now You See Me 2', 2);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user13', 'Now You See Me 2', 4);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'The BFG', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'The BFG', 2);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'The Legend of Tarzan', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'The Legend of Tarzan', 2);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'The Purge: Election Year', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'The Purge: Election Year', 2);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'The Secret Life of Pets', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Good but not great', 'As title said, I think the movie was okay', 'user19', 'The Secret Life of Pets', 2);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'The Secret Life of Pets', 2);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'The Shallows', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Good but not great', 'As title said, I think the movie was okay', 'user18', 'The Shallows', 2);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'The Shallows', 2);

INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Another great one', 'I thought it was good', 'user6', 'Our Little Sister', 5);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('Good but not great', 'As title said, I think the movie was okay', 'user16', 'Our Little Sister', 2);
INSERT INTO REVIEW (Title, Comment, Username, Movie_Title, Rating)
VALUES ('I thought it was okay', 'okay movie', 'user9', 'Our Little Sister', 2);


/*
  Movies that were/are playing in theaters in this table.
 */
CREATE TABLE PLAYS_AT (
  Theater_ID  INTEGER NOT NULL,
  Movie_Title VARCHAR(120),
  Playing     BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (Theater_ID, Movie_Title),
  FOREIGN KEY (Theater_ID) REFERENCES THEATER (Theater_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Movie_Title) REFERENCES MOVIE (Title)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*
  When creating database, add movies that have reached released date into plays at
 */
INSERT INTO PLAYS_AT (Theater_ID, Movie_Title)
  SELECT
    Theater_ID,
    MOVIE.Title AS Movie_Title
  FROM MOVIE, THEATER
  WHERE MOVIE.Release_Date <= current_date;


/*
  Each movie playing at a theater has a show time.
  This table contains this information.
 */
CREATE TABLE SHOW_TIME (
  Theater_ID  INTEGER NOT NULL,
  Movie_Title VARCHAR(120),
  Show_Time   DATETIME,
  PRIMARY KEY (Theater_ID, Movie_Title, Show_Time),
  FOREIGN KEY (Movie_Title) REFERENCES MOVIE (Title)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Theater_ID) REFERENCES THEATER (Theater_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/*
  Populating show_time data
 */
DROP PROCEDURE IF EXISTS create_show_times;

CREATE PROCEDURE create_show_times()
  BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 10 DO
      INSERT INTO SHOW_TIME (Theater_ID, Movie_Title, Show_Time)
        SELECT Theater_ID, MOVIE.Title AS Movie_Title, TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, current_timestamp, NOW() + INTERVAL 18 DAY)), CURRENT_TIMESTAMP) AS Show_Time
      FROM MOVIE, THEATER
      WHERE MOVIE.Release_Date <= CURRENT_TIMESTAMP;
      SET i = i + 1;
    END WHILE;
  END;

CALL create_show_times();

/*
  All orders are added into this table.
 */
CREATE TABLE ORDER_ITEMS (
  Theater_ID     INTEGER                             NOT NULL,
  Order_ID       INTEGER AUTO_INCREMENT,
  Movie_Title    VARCHAR(120)                        NOT NULL,
  Status         INTEGER DEFAULT 0                   NOT NULL,
  CHECK (Status >= 0 AND Status <= 2),
  Date_Purch     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  Show_Time      DATETIME                            NOT NULL,
  Total_Price  DOUBLE                             NOT NULL,
  Senior_Tickets INTEGER                             NOT NULL,
  Child_Tickets  INTEGER                             NOT NULL,
  Adult_Tickets  INTEGER                             NOT NULL,
  Card_Info      CHAR(16)                            NOT NULL,
  Username       VARCHAR(20)                         NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Theater_ID) REFERENCES THEATER (Theater_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (Movie_Title) REFERENCES MOVIE (Title)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (Card_Info) REFERENCES CARD_INFO (Card_Num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (Username) REFERENCES USER (Username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

/*
  10+ canceled tickets
 */

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 1, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 1, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4916350883570529', 'user7');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Captain Fantastic', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Captain Fantastic', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Our Little Sister', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4556485200573817', 'user8');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Shallows', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Purge: Election Year', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Legend of Tarzan', 1, '2016-06-15 10:12:12', 92.23, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Captain Fantastic', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Our Little Sister', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Shallows', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');


/**
  Unused tickets
 */

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 0, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 0, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 0, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Captain Fantastic', 0, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Our Little Sister', 0, '2016-05-21 10:12:12', 68.22, 5, 5, 5, '4556485200573817', 'user8');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Purge: Election Year', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Legend of Tarzan', 1, '2016-07-15 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '347963302639878', 'user15');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user15');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5139458838530551', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5139458838530551', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user12');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user12');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user11');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5530776198357173', 'user13');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '5530776198357173', 'user13');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Captain Fantastic', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'Ben-Hur', 0, '2016-07-26 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

/*
  Not canceled, on a future date
 */

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '347963302639878', 'user15');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user15');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4532036212121779', 'user10');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4556485200573817', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '4929897020828157', 'user9');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5139458838530551', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5139458838530551', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user12');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user12');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user11');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5196806190658511', 'user11');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5530776198357173', 'user13');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '5530776198357173', 'user13');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');


INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (3, 'Ben-Hur', 0, '2016-08-01 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user14');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'The Shallows', 0, '2016-08-01 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Finding Dory', 0, '2016-08-01 10:12:12', 68.22, 5, 5, 5, '4716211661228619', 'user6');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (2, 'The Secret Life of Pets', 0, '2016-08-01 10:12:12', 68.22, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Captain Fantastic', 0, '2016-08-01 10:12:12', 68.22, 5, 5, 5, '4916350883570529', 'user7');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (1, 'Our Little Sister', 0, '2016-08-01 10:12:12', 68.22, 5, 5, 5, '4556485200573817', 'user8');


/*
  Orders to test triggers that once show time has been reached, ticket status that is not canceled is now 'complete'
  The first order should be changed. The second order should not.
 */
INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (4, 'Finding Dory', 0, '2016-07-08 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user8');

INSERT INTO ORDER_ITEMS (Theater_ID, Movie_Title,
                         Status, Show_Time,
                         Total_Price, Senior_Tickets,
                         Child_Tickets, Adult_Tickets, Card_Info, Username)

VALUES (4, 'Finding Dory', 1, '2016-07-08 10:12:12', 73.75, 5, 5, 5, '6011940668105126', 'user8');

/*
  Table for adding user's preferred theaters.
 */
CREATE TABLE PREFERS (
  Theater_ID INTEGER     NOT NULL,
  Username   VARCHAR(20) NOT NULL,
  PRIMARY KEY (Theater_ID, Username),
  FOREIGN KEY (Theater_ID) REFERENCES THEATER (Theater_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Username) REFERENCES USER (Username)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/**
  Populating data.
 */
INSERT INTO PREFERS VALUES (1, 'user6');
INSERT INTO PREFERS VALUES (2, 'user6');
INSERT INTO PREFERS VALUES (3, 'user6');
INSERT INTO PREFERS VALUES (4, 'user6');
INSERT INTO PREFERS VALUES (5, 'user6');
INSERT INTO PREFERS VALUES (6, 'user6');
INSERT INTO PREFERS VALUES (1, 'user7');
INSERT INTO PREFERS VALUES (2, 'user7');
INSERT INTO PREFERS VALUES (3, 'user7');
INSERT INTO PREFERS VALUES (1, 'user8');
INSERT INTO PREFERS VALUES (2, 'user8');
INSERT INTO PREFERS VALUES (3, 'user8');
INSERT INTO PREFERS VALUES (1, 'user9');
INSERT INTO PREFERS VALUES (2, 'user9');
INSERT INTO PREFERS VALUES (3, 'user9');
INSERT INTO PREFERS VALUES (1, 'user10');
INSERT INTO PREFERS VALUES (2, 'user10');
INSERT INTO PREFERS VALUES (3, 'user10');
INSERT INTO PREFERS VALUES (1, 'user11');
INSERT INTO PREFERS VALUES (2, 'user12');
INSERT INTO PREFERS VALUES (3, 'user13');
INSERT INTO PREFERS VALUES (1, 'user14');
INSERT INTO PREFERS VALUES (1, 'user15');
INSERT INTO PREFERS VALUES (1, 'user16');
INSERT INTO PREFERS VALUES (1, 'user17');
INSERT INTO PREFERS VALUES (2, 'user18');
INSERT INTO PREFERS VALUES (2, 'user19');
INSERT INTO PREFERS VALUES (2, 'user20');

/*
  Turn on events.
 */
SET GLOBAL event_scheduler = ON;

/*
  Event: Once a movie is shown, the status of ticket is turned into complete.
 */
DROP EVENT IF EXISTS update_ticket;
CREATE
EVENT `update_ticket`
  ON SCHEDULE EVERY 1 DAY
DO BEGIN
  UPDATE ORDER_ITEMS
  SET Status = 2
  WHERE Status = 0 AND Show_Time < current_timestamp;
END;

/*
  EVENT: Once released date has reached, we update Plays_At and show_time
 */
DROP EVENT IF EXISTS update_plays_at;
CREATE
EVENT `update_plays_at`
  ON SCHEDULE EVERY 1 DAY
  DO BEGIN
    INSERT INTO PLAYS_AT (Theater_ID, Movie_Title)
      SELECT
        Theater_ID,
        MOVIE.Title AS Movie_Title
      FROM MOVIE, THEATER
      WHERE MOVIE.Release_Date <= current_date AND MOVIE.Title NOT IN (SELECT P.Movie_Title FROM PLAYS_AT P);
  END;

/*
  EVENT: Once released date has reached, show_time is updated.
 */
DROP EVENT IF EXISTS update_show_time;

CREATE
EVENT `update_show_time`
  ON SCHEDULE EVERY 1 DAY
  DO BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 10 DO
      INSERT INTO SHOW_TIME (Theater_ID, Movie_Title, Show_Time)
        SELECT Theater_ID, MOVIE.Title AS Movie_Title, TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, current_timestamp, NOW() + INTERVAL 18 DAY)), CURRENT_TIMESTAMP) AS Show_Time
      FROM MOVIE, THEATER
      WHERE MOVIE.Release_Date <= CURRENT_TIMESTAMP;
      SET i = i + 1;
    END WHILE;
  END;


DROP VIEW IF EXISTS POPULAR_MOVIES;

CREATE VIEW POPULAR_MOVIES AS
  SELECT
  Year(A.Show_Time) AS Year,
  MONTHNAME(A.Show_Time) AS Month,
  A.Movie_Title,
  (SUM(A.Senior_Tickets) + SUM(A.Child_Tickets) + SUM(A.Adult_Tickets)) AS Total_Orders
  FROM order_items As A
  WHERE A.Status != 1
  GROUP BY Movie_Title, Month, Year
  ORDER BY Year DESC, Month DESC, Total_Orders DESC;

DROP VIEW IF EXISTS POPULAR_MOVIES_FINAL;

CREATE VIEW POPULAR_MOVIES_FINAL AS
  (SELECT * FROM POPULAR_MOVIES WHERE Month = 'May' ORDER BY Total_Orders DESC LIMIT 3)
  UNION ALL
  (SELECT * FROM POPULAR_MOVIES WHERE Month = 'June' ORDER BY Total_Orders DESC LIMIT 3)
  UNION ALL
  (SELECT * FROM POPULAR_MOVIES WHERE Month = 'July' ORDER BY Total_Orders DESC LIMIT 3)
  UNION ALL
  (SELECT * FROM POPULAR_MOVIES WHERE Month = 'August' ORDER BY Total_Orders DESC LIMIT 3);

DROP VIEW IF EXISTS REVENUE_VIEW;

CREATE VIEW REVENUE_VIEW AS
  SELECT MONTHNAME(Show_Time) AS Month, Revenue
  FROM
  (
  SELECT		Show_Time,
            Year(Show_Time)  	AS Year,
            MONTH(Show_Time) 	AS Month,
            SUM(Total_Price) 	AS Revenue
    FROM 		order_items
      GROUP BY 	Month, Year
      ORDER BY 	Year ASC , Month ASC
      LIMIT 3
  ) t ;

DROP TRIGGER IF EXISTS exp_date_trig;

CREATE TRIGGER exp_date_trig AFTER insert on CARD_INFO
  FOR EACH ROW
  BEGIN
    DECLARE msg VARCHAR(255);
    IF (New.Exp_Date < Now()) THEN
        set msg = "Expiration Date is before today's date.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
  END;

