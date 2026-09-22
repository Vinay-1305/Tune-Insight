# 🎵 Tune-Insight Using SQL

## 📌 Project Overview

This project analyzes a **Music Store database using SQL** to extract meaningful business insights from customer purchases, invoices, artists, albums, tracks, genres, and employees.

The project focuses on using SQL to answer real-world business questions related to **customer behavior, sales, revenue, popular genres, artists, and purchasing patterns**.

---

## 👨‍💻 About Me

**Ch Vinay**  
B.Tech – Electronics and Communication Engineering

I am interested in **Data Analytics and Data Science** and have knowledge of:

- SQL
- Python
- Pandas
- NumPy
- Data Visualization

This project helped me improve my SQL and analytical skills while working with a relational database and real-world-style business data.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Analyze customer purchasing behavior
- Identify top customers
- Discover popular music genres
- Find top-performing artists and tracks
- Analyze revenue by city and country
- Use SQL to generate useful business insights
- Practice advanced SQL concepts on a relational database

---

## 🗄️ Database Overview

The Music Store database contains **11 related tables**:

| Table | Description |
|---|---|
| `Artist` | Stores artist information |
| `Album` | Stores album information |
| `Genre` | Stores music genre information |
| `MediaType` | Stores media type information |
| `Track` | Stores individual track information |
| `Customer` | Stores customer information |
| `Employee` | Stores employee information |
| `Invoice` | Stores customer invoice information |
| `InvoiceLine` | Stores individual items purchased in each invoice |
| `Playlist` | Stores playlist information |
| `PlaylistTrack` | Connects playlists with tracks |

### 🔗 Database Schema

![Music Store Database Schema](schema_diagram.png)

The database uses **primary keys and foreign keys** to maintain relationships between tables.

---

## 🧠 SQL Concepts Used

This project uses a range of SQL concepts, including:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `LIMIT`
- `DISTINCT`
- `INNER JOIN`
- Aggregate Functions
  - `COUNT()`
  - `SUM()`
  - `AVG()`
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- `RANK()`
- Primary Keys
- Foreign Keys
- Indexes

---

## 🔎 Business Questions / Analysis

The project answers the following key business questions:

### 1. Senior Most Employee
Identify the senior-most employee in the organization.

### 2. Countries With the Highest Number of Invoices
Find the countries that generate the highest number of invoices.

### 3. Top 3 Invoice Values
Identify the three highest invoice totals.

### 4. City With the Best Revenue
Find the city that generates the highest total revenue.

### 5. Best Customer
Identify the customer who has spent the most money.

### 6. Rock Music Listeners
Find customers who have purchased Rock music.

### 7. Top 10 Rock Artists
Identify the top 10 artists based on the number of Rock tracks.

### 8. Tracks Longer Than Average
Find tracks whose duration is greater than the average track duration.

### 9. Customer Spending on Artists
Analyze how much each customer has spent on different artists.

### 10. Most Popular Genre by Country
Determine the most purchased music genre in each country using ranking functions.

### 11. Top Customer by Country
Identify the highest-spending customer in each country.

---

## 📊 Key Findings

Some of the major insights obtained from the analysis include:

- 🇺🇸 The **USA generated the highest number of invoices**.
- 💰 The **best customer contributed the highest amount of spending**.
- 🎸 **Rock music is one of the most popular genres** in the dataset.
- 🎤 Several artists contributed significantly to overall music sales.
- 🌎 Revenue and purchasing behavior vary across different countries.
- 🏙️ Certain cities generate significantly higher revenue than others.
- 👥 Customer spending can be compared across artists and countries to identify valuable customers.

---

## 🛠️ Challenges Faced

During the project, some of the main challenges were:

- Understanding relationships between multiple tables
- Importing CSV files into the database
- Creating primary key and foreign key relationships
- Writing complex `JOIN` queries
- Performing aggregation across multiple tables
- Using CTEs and window functions for ranking analysis
- Handling business questions that required multiple related tables

### 💡 Solutions

To overcome these challenges:

- Used the database schema diagram to understand table relationships
- Verified imported data before running analysis
- Tested SQL queries step by step
- Used `JOIN` conditions carefully to connect related tables
- Used CTEs and window functions for advanced analytical queries

---

## 📁 Project Structure

```text
Music-Store-Data-Analysis/
│
├── album.csv
├── artist.csv
├── customer.csv
├── employee.csv
├── genre.csv
├── invoice.csv
├── invoiceline.csv
├── mediatype.csv
├── playlist.csv
├── playlisttrack.csv
├── track.csv
├── main.sql
├── schema_diagram.png
└── README.md
```

---

## ▶️ How to Use

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Open the SQL file

Open:

```text
main.sql
```

### 3. Create the database

The SQL script contains the table definitions, relationships, indexes, and analytical queries.

Example:

```sql
CREATE DATABASE music_db;
USE music_db;
```

### 4. Import the CSV files

Import the CSV datasets into their corresponding tables.

### 5. Run the analytical queries

Execute the queries in `main.sql` to reproduce the analysis.

---

## 📈 Skills Demonstrated

This project demonstrates practical knowledge of:

- **SQL**
- **Relational Database Design**
- **Data Analysis**
- **Data Aggregation**
- **Business Intelligence**
- **Data Cleaning & Validation**
- **Joins and Relationships**
- **Advanced SQL**
- **CTEs**
- **Window Functions**
- **Ranking Analysis**

---

## 🚀 What I Learned

Through this project, I:

- Improved my SQL query-writing skills
- Learned how to work with relational databases
- Understood relationships between multiple tables
- Practiced complex joins and aggregations
- Learned how to use CTEs and window functions
- Gained practical experience analyzing business data
- Learned how to convert raw data into meaningful insights

---

## 👤 Author

**Ch Vinay**

- 🔗 LinkedIn: [Ch Vinay](https://www.linkedin.com/in/ch-vinay-183752327/)
- 💻 GitHub: Add your GitHub profile link here

---

## ⭐ Conclusion

The **Music Store Data Analysis** project demonstrates how SQL can be used to analyze business data and generate meaningful insights.

By analyzing customers, invoices, tracks, artists, genres, and purchasing patterns, this project provides a practical example of how **SQL and data analytics can support business decision-making**.

---

## 🙌 Thank You

Thank you for visiting this project!

If you found this project useful, consider giving the repository a ⭐.
