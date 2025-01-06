### Dynamic Sales Insights Dashboard A Power BI Case Study for Data-Driven Decision Making

### Power BI

### Power query

### Filtering the null values in markets table

= Table.SelectRows(dbo_markets, each ([zone] <> null))

### Converting US currency to Indian currency

= Table.AddColumn(#"Filtered Rows", "sales", each if [currency] = "USD" then [sales_amount]*85 else [sales_amount])

### Creating new measure Sales Revenue

Revenue = sum(transactions[sales_amount])

### Creating new measure Sales Quantity

Sales Quantity = sum(transactions[sales_qty])
