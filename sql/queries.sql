--Total Revenue
SELECT SUM(Revenue) AS TotalRevenue
FROM Bookings;

--Revenue by Country
SELECT Country, SUM(Revenue) AS Revenue
FROM Bookings
GROUP BY Country
ORDER BY Revenue DESC;

--Cancellation Rate (% of bookings by status)
SELECT
  "Booking Status",
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Bookings) AS Percentage
FROM Bookings
GROUP BY "Booking Status";

--Top Destinations (by number of bookings)
SELECT Destination, COUNT(*) AS Bookings
FROM Bookings
GROUP BY Destination
ORDER BY Bookings DESC;

--Consultant Performance (revenue generated per consultant)
SELECT Consultant, SUM(Revenue) AS Revenue
FROM Bookings
GROUP BY Consultant
ORDER BY Revenue DESC;

--Average Booking Value
SELECT AVG(Revenue) AS AvgBookingValue
FROM Bookings;

--Monthly Bookings Trend (bookings & revenue by month)
SELECT
  strftime('%Y-%m', "Booking Date") AS Month,
  COUNT(*) AS Bookings,
  SUM(Revenue) AS Revenue
FROM Bookings
GROUP BY Month
ORDER BY Month;

--Most popular Bookings Channel
SELECT "Booking Channel", COUNT(*) AS Bookings
FROM Bookings
GROUP BY "Booking Channel"
ORDER BY Bookings DESC;






