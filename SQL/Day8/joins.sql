use normal_db;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    release_date DATE,
    duration INT,
    language VARCHAR(50),
    certificate VARCHAR(10)
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE
);

CREATE TABLE Directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(100) NOT NULL,
    experience INT
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) UNIQUE
);

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(100),
    location VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_id INT,
    screen_name VARCHAR(50),
    total_seats INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screen_id INT,
    show_date DATE,
    show_time TIME,
    ticket_price DECIMAL(8,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    show_id INT,
    booking_date DATETIME,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

select * from Bookings;

INSERT INTO Movies (movie_name, release_date, duration, language, certificate) VALUES
('Leo', '2023-10-19', 164, 'Tamil', 'U/A'),
('Jailer', '2023-08-10', 168, 'Tamil', 'U/A'),
('Vikram', '2022-06-03', 175, 'Tamil', 'U/A'),
('Master', '2021-01-13', 179, 'Tamil', 'U/A'),
('Good Night', '2023-05-12', 145, 'Tamil', 'U');

INSERT INTO Actors (actor_name, gender, dob) VALUES
('Vijay', 'Male', '1974-06-22'),
('Rajinikanth', 'Male', '1950-12-12'),
('Kamal Haasan', 'Male', '1954-11-07'),
('Kavin', 'Male', '1990-06-22'),
('Trisha', 'Female', '1983-05-04');

INSERT INTO Directors (director_name, experience) VALUES
('Lokesh Kanagaraj', 10),
('Nelson Dilipkumar', 8),
('Pa. Ranjith', 12),
('Mani Ratnam', 35),
('Vinayak Chandrasekaran', 7);

INSERT INTO Genres (genre_name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Thriller'),
('Romance');

INSERT INTO Theaters (theater_name, location, phone) VALUES
('PVR Cinemas', 'Chennai', '9876543210'),
('INOX', 'Pondicherry', '9876543211'),
('AGS Cinemas', 'Chennai', '9876543212'),
('SPI Palazzo', 'Chennai', '9876543213'),
('KG Cinemas', 'Coimbatore', '9876543214');

INSERT INTO Screens (theater_id, screen_name, total_seats) VALUES
(1, 'Screen 1', 200),
(1, 'Screen 2', 180),
(2, 'Screen 1', 150),
(3, 'Screen 1', 220),
(4, 'Screen 1', 250);

INSERT INTO Shows (movie_id, screen_id, show_date, show_time, ticket_price) VALUES
(1, 1, '2026-08-10', '10:00:00', 180.00),
(2, 2, '2026-08-10', '14:00:00', 200.00),
(3, 3, '2026-08-11', '18:30:00', 220.00),
(4, 4, '2026-08-12', '11:00:00', 190.00),
(5, 5, '2026-08-13', '20:00:00', 250.00);

INSERT INTO Customers (customer_name, phone, email) VALUES
('Arun Kumar', '9000000001', 'arun@gmail.com'),
('Priya', '9000000002', 'priya@gmail.com'),
('Rahul', '9000000003', 'rahul@gmail.com'),
('Divya', '9000000004', 'divya@gmail.com'),
('Karthik', '9000000005', 'karthik@gmail.com');

INSERT INTO Bookings (customer_id, show_id, booking_date, total_amount) VALUES
(1, 1, '2026-08-04 10:15:00', 360.00),
(2, 2, '2026-08-04 11:00:00', 200.00),
(3, 3, '2026-08-04 11:30:00', 440.00),
(4, 4, '2026-08-04 12:15:00', 190.00),
(5, 5, '2026-08-04 13:00:00', 500.00);
select * from Screens;

CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

INSERT INTO Movie_Genres VALUES
(1,1),
(2,1),
(3,4),
(4,1),
(5,2);

SELECT m.movie_name, g.genre_name FROM Movies m INNER JOIN Movie_Genres mg ON m.movie_id = mg.movie_id INNER JOIN Genres g ON mg.genre_id = g.genre_id;

CREATE TABLE Movie_Directors (
    movie_id INT,
    director_id INT,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

INSERT INTO Movie_Directors (movie_id, director_id) VALUES
(1,1),
(2,2),
(3,1),
(4,4),
(5,5);

SELECT
    m.movie_name,
    d.director_name
FROM Movies m
INNER JOIN Movie_Directors md
    ON m.movie_id = md.movie_id
INNER JOIN Directors d
    ON md.director_id = d.director_id;
    
    CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

INSERT INTO Movie_Actors (movie_id, actor_id) VALUES
(1,1),  
(1,5),  
(2,2), 
(3,3), 
(4,1), 
(5,4);

SELECT
    m.movie_name,
    a.actor_name
FROM Movies m
INNER JOIN Movie_Actors ma
ON m.movie_id = ma.movie_id
INNER JOIN Actors a
ON ma.actor_id = a.actor_id;

SELECT
    m.movie_name,
    b.booking_id,
    b.booking_date,
    b.total_amount
FROM Movies m
LEFT JOIN Shows s
ON m.movie_id = s.movie_id
LEFT JOIN Bookings b
ON s.show_id = b.show_id;

SELECT
    c.customer_id,
    c.customer_name,
    b.booking_id,
    b.booking_date,
    b.total_amount
FROM Bookings b
RIGHT JOIN Customers c
ON b.customer_id = c.customer_id;

SELECT
    c.customer_name,
    m.movie_name,
    t.theater_name,
    s.show_time
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Shows s
ON b.show_id = s.show_id
INNER JOIN Movies m
ON s.movie_id = m.movie_id
INNER JOIN Screens sc
ON s.screen_id = sc.screen_id
INNER JOIN Theaters t
ON sc.theater_id = t.theater_id;

SELECT
    a.actor_name,
    m.movie_name
FROM Actors a
LEFT JOIN Movie_Actors ma
ON a.actor_id = ma.actor_id
LEFT JOIN Movies m
ON ma.movie_id = m.movie_id;