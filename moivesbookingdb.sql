--MovieBookingDB.sql
CREATE DATABASE IF NOT EXISTS MovieBookingDB;
USE MovieBookingDB;

--Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

--Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    duration_min INT,
    release_date DATE
);

--Theaters Table
CREATE TABLE Theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    total_seats INT
);

--Shows Table
CREATE TABLE Shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    theater_id INT,
    show_time DATETIME,
    ticket_price DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

--Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    show_id INT,
    seats_booked INT,
    booking_date DATETIME DEFAULT NOW(),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

--Sample Data
INSERT INTO Users (name, email, phone) VALUES
('Dharani Bhoreddy', 'dharani@example.com', '9876543210'),
('Ravi Kumar', 'ravi@example.com', '9123456780');

INSERT INTO Movies (title, genre, duration_min, release_date) VALUES
('Avengers: Endgame', 'Action', 180, '2019-04-26'),
('Inception', 'Sci-Fi', 148, '2010-07-16'),
('Interstellar', 'Sci-Fi', 169, '2014-11-07');

INSERT INTO Theaters (name, location, total_seats) VALUES
('PVR Cinemas', 'Hyderabad', 100),
('INOX', 'Secunderabad', 80);

INSERT INTO Shows (movie_id, theater_id, show_time, ticket_price) VALUES
(1, 1, '2026-02-13 18:00:00', 300.00),
(2, 2, '2026-02-13 20:00:00', 250.00),
(3, 1, '2026-02-14 17:00:00', 350.00);

INSERT INTO Bookings (user_id, show_id, seats_booked, total_amount) VALUES
(1, 1, 3, 900.00),
(2, 2, 2, 500.00),
(1, 3, 1, 350.00);
