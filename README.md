# 🍕 Pizza Sales Analysis Project

### ***📄 Project Overview***
The Pizza Sales Analysis project is a comprehensive end-to-end data analysis designed to explore sales performance, customer preferences, and operational insights for a pizza business. This project utilizes SQL for data extraction and analysis and Power BI for visualization and dashboard creation. It demonstrates the ability to work with real-world datasets and draw actionable insights for business growth.

# 📊 Project Data Source

The project is based on pizza sales data provided in CSV format. The dataset includes the following files:

Orders: Details of each customer order.
Order Details: Itemized breakdown of each order.
Pizzas: Information about each pizza, including its size.
Pizza Types: Details of pizza categories and ingredients.

# 🔄 Workflow and Tools Used
Workflow
### 1. Data Import:
- Uploaded CSV files into MySQL using the Table Import Wizard.

### 2. Data Analysis in SQL:
- Solved 13 insightful queries to analyze sales data, including:
- Total revenue by pizza category and size.
- Top-selling pizza types.
- Orders distributed by hour of the day.
- Average revenue per order and more.
- Used JOINS, CTEs, and Window Functions to perform complex data analysis.
- Created a final SQL query to compile a table with only meaningful insights.

### 3. Data Visualization in Power BI:
- Loaded the cleaned and aggregated data from MySQL to Power BI using ODBC Connector.
- Created an interactive dashboard to visualize:
  Revenue by pizza category and size.
  Hourly order trends.
  Key operational metrics.

# 🛠 Tools Used

1. MySQL: For data storage, query execution, and analysis.
2. Power BI: For creating interactive dashboards and visualizing key insights.
3. ODBC Connector: For seamless data integration between MySQL and Power BI.

# ✨ Key Features

### ***SQL-Based Data Analysis:***
Mastered advanced SQL features, including CTEs and Window Functions.

### ***Insightful Query Solutions:***
Solved real-world business questions to extract actionable insights from the data.

### ***Interactive Power BI Dashboard:***
Comprehensive visualization of pizza sales performance, including revenue, sales trends, and operational efficiency.

# End-to-End Workflow:
From raw CSV files to actionable dashboards, showcasing data pipeline expertise.

# 🚀 How to Use
***Clone this repository to your local machine.***

***Use the provided SQL scripts to set up the database in MySQL and analyze the data.***

***-- Basic:***
- Q1. Retrieve the total number of orders placed.
- Q2. Calculate the total revenue generated from pizza sales.
- Q3. Identify the highest-priced pizza.
- Q4. Identify the most common pizza size ordered.
- Q5. List the top 5 most ordered pizza types along with their quantities.


***-- Intermediate:***
- Q6. Join the necessary tables to find the total quantity of each pizza category ordered.
- Q7. Determine the distribution of orders by hour of the day.
- Q8. Join relevant tables to find the category-wise distribution of pizzas.
- Q9. Group the orders by date and calculate the average number of pizzas ordered per day.
- Q10. Determine the top 3 most ordered pizza types based on revenue.


***-- Advanced:***
- Q11. Calculate the percentage contribution of each pizza type to total revenue.
- Q12. Analyze the cumulative revenue generated over time.
- Q13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.


***Use ODBC Connector to load the data into Power BI and explore the interactive dashboards.***

# 🖼 Screenshots
### Power BI Dashboard Highlights:
![BI Dashboard](https://github.com/user-attachments/assets/35044a87-6a1e-46b8-b30b-391cc1068ed5)


### SQL QUERIES
<img src="https://github.com/user-attachments/assets/b642aada-82c0-4cc9-90f1-1f5b7387e0ac" alt="SQL Query Q1-Q3" width="400">
<img src="https://github.com/user-attachments/assets/0d9154ec-e39f-495e-a6b6-7d088f67d4cf" alt="SQL Query Q4-Q5" width="400">
<img src="https://github.com/user-attachments/assets/f75121f8-7e4b-4bcc-a6ee-6322966f8d91" alt="SQL Query Q6-Q8" width="400">
<img src="https://github.com/user-attachments/assets/f05e44b4-3b09-4441-9d06-be5531d75833" alt="SQL Query Q9-Q10" width="400">
<img src="https://github.com/user-attachments/assets/169c0e5c-b627-423c-b796-62c7072d9ead" alt="SQL Query Q11" width="400">
<img src="https://github.com/user-attachments/assets/6c559308-2dd8-4bcc-b0ad-46c995143469" alt="SQL Query Q12" width="400">
<img src="https://github.com/user-attachments/assets/4d65a570-9a70-488d-83af-e6fff51e641c" alt="SQL Query Q13" width="400">


### SQL QUERY TO CREATE TABLE
![Table query](https://github.com/user-attachments/assets/c7c95475-0876-421c-befc-77a67126cbee)


# 🙏 Acknowledgments
- Data Source: Pizza Sales Dataset in CSV format.
- Tools Used: MySQL for data analysis, Power BI for visualization.
- Special thanks to the community for providing resources and guidance to improve analytical workflows.

***Feel free to explore, give feedback, and contribute to this repository! If you find it useful, don’t forget to ⭐ this project!***
