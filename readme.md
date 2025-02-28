# **Dynamic Sales Insights Dashboard - A Power BI Case Study for Data-Driven Decision Making**  

## **Overview**  
This project involves building a **Dynamic Sales Insights Dashboard** using **Power BI** to facilitate data-driven decision-making. The dashboard provides key sales insights such as revenue trends, top-performing customers and products, and market-wise sales performance.  

## **Key Features**  
- **Interactive Sales Dashboard:** Displays revenue trends, top customers, top products, and market performance.  
- **Revenue and Sales Quantity Metrics:** Created measures for revenue and sales quantity to track sales performance.  
- **Currency Conversion:** Converts USD to INR for consistency in financial reporting.  
- **Data Cleaning & Transformation:** Removed null values and refined market data for accuracy.  

## **Data Processing Steps**  

### **1. Filtering Null Values in Market Table**  
To remove null values from the `dbo_markets` table:  
```PowerQuery  
= Table.SelectRows(dbo_markets, each ([zone] <> null))  
```

### **2. Converting US Currency to Indian Currency**  
To standardize revenue, we applied the following transformation:  
```PowerQuery  
= Table.AddColumn(#"Filtered Rows", "sales", each if [currency] = "USD" then [sales_amount]*85 else [sales_amount])  
```
(Assuming an exchange rate of **1 USD = 85 INR**).  

### **3. Creating Sales Revenue Measure**  
To calculate total sales revenue:  
```DAX  
Revenue = SUM(transactions[sales_amount])  
```

### **4. Creating Sales Quantity Measure**  
To calculate total sales quantity:  
```DAX  
Sales Quantity = SUM(transactions[sales_qty])  
```

## **Insights Derived**  
- **Total Revenue:** ₹987M  
- **Total Sales Quantity:** 2M units  
- **Top Customer:** Electrical… (₹414M revenue)  
- **Top Market by Revenue:** Delhi NCR (₹521M)  
- **Top Market by Sales Quantity:** Delhi NCR (0.99M units)  
- **Revenue Trend:** Fluctuating with a declining trend towards 2020  


