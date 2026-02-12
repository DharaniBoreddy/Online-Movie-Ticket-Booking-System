--SampleQueries.sql

--Available seats for a show
SELECT t.name AS theater_name, 
       t.total_seats - IFNULL(SUM(b.seats_booked),0) AS available_seats
FROM Theaters t
JOIN Shows s ON t.theater_id = s.theater_id
LEFT JOIN Bookings b ON s.show_id = b.show_id
WHERE s.show_id = 1
GROUP BY t.total_seats;

--Top booked movies
SELECT m.title, SUM(b.seats_booked) AS total_booked
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title
ORDER BY total_booked DESC;

--Bookings per user
SELECT u.name AS user_name, m.title AS movie_title, b.seats_booked, b.total_amount
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id;

--Total revenue per movie
SELECT m.title, SUM(b.total_amount) AS revenue
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title;
