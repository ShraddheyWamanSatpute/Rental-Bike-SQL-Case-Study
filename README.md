# Bike Rental Shop - SQL Case Study

## Overview
This case study explores rental data for a bike shop owned by Emily. The goal is to extract insights from the database using SQL, optimize business operations, and generate meaningful reports.

## Dataset
The dataset consists of five relational tables that store information about customers, bikes, rentals, and memberships.

### **Key Tables**
- **`customer`** – Stores customer details.
- **`bike`** – Contains information about available bike models, pricing, and status.
- **`rental`** – Records rental transactions, including timestamps and total payments.
- **`membership_type`** – Defines membership categories and pricing.
- **`membership`** – Tracks customer memberships, including start and end dates.

## Business Questions
The case study includes SQL queries to answer key business questions for Emily’s bike rental shop:

### **1. Inventory Analysis**
- Count the number of bikes owned by category.
- Display only the categories where the number of bikes is greater than 2.

### **2. Customer Membership Insights**
- List customers and the number of memberships purchased.
- Ensure that customers with zero memberships are displayed with a count of `0`.

### **3. Seasonal Pricing Strategy**
- Apply winter discounts to bike rentals based on category:
  - **Electric bikes**: 10% off hourly rentals, 20% off daily rentals.
  - **Mountain bikes**: 20% off hourly rentals, 50% off daily rentals.
  - **Other bikes**: 50% off all rentals.

### **4. Rental Availability**
- Count the number of rented and available bikes per category.

### **5. Revenue Analysis**
- Calculate total rental revenue by **month**, **year**, and **all-time total**.
- Provide a structured output where yearly totals follow monthly breakdowns.

### **6. Membership Revenue Breakdown**
- Display total membership revenue by **year, month, and membership type**.
- Sort results chronologically and alphabetically.

### **7. Membership Revenue Report for 2023**
- Display membership revenue for **each month and membership type**.
- Generate **subtotals** and **grand totals** for different combinations.

### **8. Customer Segmentation Based on Rental Activity**
- Categorize customers based on the number of rentals:
  - **More than 10 rentals** → `'more than 10'`
  - **5 to 10 rentals** → `'between 5 and 10'`
  - **Fewer than 5 rentals** → `'fewer than 5'`
- Count the number of customers in each category.

---

## SQL Techniques Used


- **`INNER JOIN`** – Used to combine related data across tables.
- **`LEFT JOIN`** – Ensures customers without memberships are still included.


- **`SUM()`, `COUNT()`, `AVG()`, `MAX()`, `MIN()`** – Used for revenue calculations and rental statistics.


- **`WHERE` & `HAVING`** – Used to filter results.
- **`CASE` Statements** – Used for:
  - Categorizing customers based on rental count.
  - Applying seasonal discounts to rental prices.

- **`Common Table Expressions (CTEs)`**- Used for simplifying complex queries** by structuring them into readable sections.


