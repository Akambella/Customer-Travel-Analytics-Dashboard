# Customer Travel Booking Analytics Dashboard

![Executive Overview](images/executive_overview.png)

## Project Overview

I built this project to practice working with real-world style data from end to end. It covers 1,000 customer travel bookings and looks at things like revenue trends, customer behavior, consultant performance, and cancellations. The idea was to go through the full analyst workflow: raw data, cleaning, querying, and finally a dashboard that someone in a business could actually use.

## The Problem I Was Solving

Travel companies have a lot of booking data but it is easy to lose track of what is actually driving revenue, which consultants are performing well, or why customers are cancelling. This project tries to answer those questions in one place.

## Tools I Used

- **Excel** for structuring the raw data into tables
- **Python (Pandas)** for cleaning the data, run in Google Colab
- **SQL (SQLite via DB Browser)** for writing business queries against the cleaned data
- **Power BI Service** for building the interactive dashboard
- **GitHub** for hosting the project

## Dataset

| Table | Rows | What it contains |
|---|---|---|
| Bookings | 1,000 | Revenue, dates, status, channel, consultant, destination, country, device, trip length |
| Customers | 500 | Age, gender, country, language |
| Consultants | 20 | Team, manager, experience level |
| Destinations | 25 | Region, average trip cost |

The bookings run from January 2023 to November 2024.

## What I Did

### Data Cleaning (Python)
I loaded each sheet as its own DataFrame, checked for missing values and duplicates, standardized the date columns, and exported clean CSVs ready for SQL and Power BI.

### SQL Analysis
I imported the cleaned data into a SQLite database and wrote 8 queries covering total revenue, revenue by country, cancellation rate, top destinations by bookings, consultant performance, average booking value, monthly trends, and booking channel breakdown.

### Power BI Dashboard
I imported all four tables, built relationships between them (Bookings connects to Customers, Consultants, and Destinations through their shared ID columns), and created custom DAX measures for cancellation rate, confirmation rate, repeat and one-time customer counts, the top consultant by revenue, and the consultant with the most bookings. The dashboard has four pages:

- **Executive Overview** has five KPI cards (Revenue, Bookings, Cancellation Rate, Average Value and Average Trip Length), charts for Revenue by Month, Revenue by Destination, Revenue by Country, Device Usage, Booking Channel and Age Distribution, and slicers for Country, Destination, Consultant, Status and Date Range
- **Consultant Performance** shows the Top Consultant and Most Bookings cards, the Revenue by Consultant and Bookings per Consultant charts, and a table of revenue, bookings and average value for each consultant
- **Customer Insights** covers Repeat vs New Customers, Revenue by Age Group, Customer Revenue by Age and Bookings by Country
- **Cancellation Analysis** shows the Cancellation Rate by Booking Channel, Cancellation Rate by Destination, Monthly Cancellation Rate and Booking Distribution by Status

## Key Insights

- Spain generated the highest booking volume and revenue by country, with France and Italy next in revenue, suggesting these markets should be prioritised for future campaigns.
- Consultant_12 was the top revenue generator at 268,348, while Consultant_7 handled the most bookings at 63, showing that booking volume and revenue performance do not always align across the team.
- Customers aged 45 to 59 generated the highest total revenue by age group (about 1.34M), followed closely by 30 to 44. Part of this is size, as 45 to 59 is the largest age group in the Customers table.
- 295 of the 432 customers with at least one booking (68.3%) booked more than once, so keeping existing customers matters as much as winning new ones.
- The App channel had both the highest usage and the highest cancellation rate at 23.2%, well above the 18.3% overall rate and the Website channel's 13.9%, which is worth investigating since acquiring app users who then cancel has a direct cost impact.
- Lisbon had the highest cancellation rate of any destination at about 31%, which could point to pricing, availability, or expectation issues specific to that market. Each destination has only 32 to 51 bookings, so I treat this as a signal to look into and not a firm conclusion.
- 72.6% of all bookings were confirmed, with cancellations sitting at 18.3% and pending at 9.1%, giving a solid baseline for tracking improvement over time.
- Monthly cancellation rate moved between about 11% (March 2024) and 26% (September 2024) without a clear trend, and with only 31 to 58 bookings a month, single months swing a lot.

## Notes on the Data

**Revenue includes every booking status.** The 4.28M Revenue figure counts cancelled and pending bookings as well as confirmed ones. Setting the Status slicer to Confirmed shows revenue from confirmed bookings only, which is about 3.10M.

**The dataset is simulated.** A few fields do not line up the way real data would. About a third of the bookings (373 of 1,000) have a travel date earlier than the booking date, the country on a booking often differs from the customer's own country, and the regions in the Destinations table do not match real geography (Sydney is listed under Europe, for example). The dashboard does not use the Region field or the travel dates, and Country refers to the country recorded on each booking.

## Skills This Project Covers

- Data cleaning with Python and Pandas
- SQL querying for business analysis
- DAX measure writing in Power BI
- Data modelling with relationships between tables
- Dashboard design and layout
- KPI reporting
- Translating data into business insights

## Repo Structure

```
Customer-Travel-Analytics-Dashboard/
│
├── data/           cleaned CSV files
├── sql/            queries.sql
├── python/         data cleaning notebook
├── images/         dashboard screenshots
└── README.md
```

## Dashboard Preview

### Executive Overview
![Executive Overview](images/executive_overview.png)

### Consultant Performance
![Consultant Performance](images/consultant_performance.png)

### Customer Insights
![Customer Insights](images/customer_insights.png)

### Cancellation Analysis
![Cancellation Analysis](images/cancellation_analysis.png)

## Author

Edidiong Akama
