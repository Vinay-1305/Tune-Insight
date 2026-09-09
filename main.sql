USE music_db;

-- 1. Genre
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(120) NOT NULL
);

-- 2. MediaType
CREATE TABLE MediaType (
    media_type_id INT PRIMARY KEY,
    name VARCHAR(120) NOT NULL
);

-- 3. Employee
CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
	last_name VARCHAR(120),
	first_name VARCHAR(120),
	title VARCHAR(120),
	reports_to INT,
    level VARCHAR(255),
	birthdate DATE,
	hire_date DATE,
	address VARCHAR(255),
	city VARCHAR(100),
	state VARCHAR(100),
	country VARCHAR(100),
	postal_code VARCHAR(20),
	phone VARCHAR(50),
	fax VARCHAR(50),
	email VARCHAR(100)
);

-- 4. Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(120) NOT NULL,
    last_name VARCHAR(120) NOT NULL,
    company VARCHAR(120),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    support_rep_id INT,

    CONSTRAINT fk_customer_employee
    FOREIGN KEY (support_rep_id)
    REFERENCES Employee(employee_id)
);

-- 5. Artist
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(120) NOT NULL
);

-- 6. Album
CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    title VARCHAR(160) NOT NULL,
    artist_id INT NOT NULL,

    CONSTRAINT fk_album_artist
    FOREIGN KEY (artist_id)
    REFERENCES Artist(artist_id)
);

-- 7. Track
CREATE TABLE Track (
    track_id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    media_type_id INT NOT NULL,
    genre_id INT,
    composer VARCHAR(220),
    milliseconds INT,
    bytes INT,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_track_album
    FOREIGN KEY (album_id)
    REFERENCES Album(album_id),

    CONSTRAINT fk_track_media
    FOREIGN KEY (media_type_id)
    REFERENCES MediaType(media_type_id),

    CONSTRAINT fk_track_genre
    FOREIGN KEY (genre_id)
    REFERENCES Genre(genre_id)
);

-- 8. Invoice
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    invoice_date DATE NOT NULL,
    billing_address VARCHAR(255),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_invoice_customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
);

-- 9. InvoiceLine
CREATE TABLE InvoiceLine (
    invoice_line_id INT PRIMARY KEY,
    invoice_id INT NOT NULL,
    track_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,

    CONSTRAINT fk_invoiceline_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES Invoice(invoice_id),

    CONSTRAINT fk_invoiceline_track
    FOREIGN KEY (track_id)
    REFERENCES Track(track_id)
);

-- 10. Playlist
CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- 11. PlaylistTrack
CREATE TABLE PlaylistTrack (
    playlist_id INT,
    track_id INT,

    PRIMARY KEY (playlist_id, track_id),

    CONSTRAINT fk_playlisttrack_playlist
    FOREIGN KEY (playlist_id)
    REFERENCES Playlist(playlist_id),

    CONSTRAINT fk_playlisttrack_track
    FOREIGN KEY (track_id)
    REFERENCES Track(track_id)
);

-- Indexes
CREATE INDEX idx_customer_support_rep ON Customer(support_rep_id);
CREATE INDEX idx_album_artist ON Album(artist_id);
CREATE INDEX idx_track_album ON Track(album_id);
CREATE INDEX idx_track_media_type ON Track(media_type_id);
CREATE INDEX idx_track_genre ON Track(genre_id);
CREATE INDEX idx_invoice_customer ON Invoice(customer_id);
CREATE INDEX idx_invoiceline_invoice ON InvoiceLine(invoice_id);
CREATE INDEX idx_invoiceline_track ON InvoiceLine(track_id);

SELECT COUNT(*) AS artists FROM artist;

SELECT COUNT(*) AS albums FROM album;


SELECT COUNT(*) AS genres FROM genre;

SELECT COUNT(*) AS media_types FROM mediatype;

SELECT COUNT(*) FROM track;


SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM invoice;
SELECT COUNT(*) FROM invoiceline;


SELECT 'artist', COUNT(*) FROM artist
UNION ALL
SELECT 'album', COUNT(*) FROM album
UNION ALL
SELECT 'genre', COUNT(*) FROM genre
UNION ALL
SELECT 'mediatype', COUNT(*) FROM mediatype
UNION ALL
SELECT 'employee', COUNT(*) FROM employee
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'track', COUNT(*) FROM track
UNION ALL
SELECT 'invoice', COUNT(*) FROM invoice
UNION ALL
SELECT 'invoiceline', COUNT(*) FROM invoiceline
UNION ALL
SELECT 'playlist', COUNT(*) FROM playlist
UNION ALL
SELECT 'playlisttrack', COUNT(*) FROM playlisttrack;

SELECT COUNT(*) FROM Employee;
SELECT COUNT(*) FROM Customer;
SELECT COUNT(*) FROM Invoice;
SELECT COUNT(*) FROM InvoiceLine;
SELECT COUNT(*) FROM Track;

-- Q1. Senior Most Employee
SELECT employee_id,
       first_name,
       last_name,
       title
FROM Employee;

-- Q2. Countries With Most Invoices
SELECT billing_country,
       COUNT(*) AS total_invoices
FROM Invoice
GROUP BY billing_country
ORDER BY total_invoices DESC;

-- Q3. Top 3 Invoice Totals
SELECT total
FROM Invoice
ORDER BY total DESC
LIMIT 3;

-- Q4. City With Best Customers
SELECT billing_city,
       SUM(total) AS total_revenue
FROM Invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

-- Q5. Best Customer
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       SUM(i.total) AS amount_spent
FROM Customer c
JOIN Invoice i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id,
         c.first_name,
         c.last_name
ORDER BY amount_spent DESC
LIMIT 1;

-- Q6. Rock Music Listeners
SELECT DISTINCT
       c.email,
       c.first_name,
       c.last_name,
       g.name AS genre
FROM Customer c
JOIN Invoice i
ON c.customer_id = i.customer_id
JOIN InvoiceLine il
ON i.invoice_id = il.invoice_id
JOIN Track t
ON il.track_id = t.track_id
JOIN Genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;


-- Q7. Top 10 Rock Artists
SELECT ar.name AS artist_name,
       COUNT(t.track_id) AS track_count
FROM Artist ar
JOIN Album al
ON ar.artist_id = al.artist_id
JOIN Track t
ON al.album_id = t.album_id
JOIN Genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY ar.artist_id, ar.name
ORDER BY track_count DESC
LIMIT 10;


-- Q8. Tracks Longer Than Average
SELECT name,
       milliseconds
FROM Track
WHERE milliseconds >
(
    SELECT AVG(milliseconds)
    FROM Track
)
ORDER BY milliseconds DESC;


-- Q9. Amount Spent By Each Customer On Artists
SELECT
    c.first_name,
    c.last_name,
    ar.name AS artist_name,
    SUM(il.unit_price * il.quantity) AS total_spent
FROM Customer c
JOIN Invoice i
ON c.customer_id = i.customer_id
JOIN InvoiceLine il
ON i.invoice_id = il.invoice_id
JOIN Track t
ON il.track_id = t.track_id
JOIN Album al
ON t.album_id = al.album_id
JOIN Artist ar
ON al.artist_id = ar.artist_id
GROUP BY
    c.customer_id,
    ar.artist_id
ORDER BY total_spent DESC;

-- Q10. Most Popular Genre For Each Country
WITH genre_sales AS
(
    SELECT
        i.billing_country,
        g.name AS genre_name,
        COUNT(*) AS purchases
    FROM Invoice i
    JOIN InvoiceLine il
    ON i.invoice_id = il.invoice_id
    JOIN Track t
    ON il.track_id = t.track_id
    JOIN Genre g
    ON t.genre_id = g.genre_id
    GROUP BY
        i.billing_country,
        g.name
),
ranked_genres AS
(
    SELECT *,
           RANK() OVER
           (
             PARTITION BY billing_country
             ORDER BY purchases DESC
           ) AS rnk
    FROM genre_sales
)
SELECT *
FROM ranked_genres
WHERE rnk = 1;


-- Q11. Top Customer In Each Country
WITH customer_spending AS
(
    SELECT
        i.billing_country,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM Customer c
    JOIN Invoice i
    ON c.customer_id = i.customer_id
    GROUP BY
        i.billing_country,
        c.customer_id,
        c.first_name,
        c.last_name
),
ranked_customers AS
(
    SELECT *,
           RANK() OVER
           (
             PARTITION BY billing_country
             ORDER BY total_spent DESC
           ) AS rnk
    FROM customer_spending
)
SELECT *
FROM ranked_customers
WHERE rnk = 1;

