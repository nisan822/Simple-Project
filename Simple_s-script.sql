DROP DATABASE IF EXISTS Simple;
CREATE DATABASE IF NOT EXISTS Simple; 
go
USE Simple;
go

DROP TABLE IF EXISTS DWH_Dim_SalePerson,
					 DWH_Dim_date_id,
				  	 DWH_Dim_prodcuts,
					 DWH_Dim_customers,
					 DWH_Fact_monthtly_target,
					 DWH_Fact_sales,
					 DWH_Dim_Location



CREATE TABLE DWH_Dim_SalePerson(
	SalePerson_ID VARCHAR(50) PRIMARY KEY,
	SalePerson_name VARCHAR(50)
);

CREATE TABLE DWH_Dim_Customers(
	Customer_ID VARCHAR(50) PRIMARY KEY,
	Customer_Name VARCHAR(50),
	Age INT,
	Gender VARCHAR(1)
);

Create table DWH_Dim_Location(
	Area_id varchar(50)  primary key,
	Area_code int,
	County  varchar(50),
	State_code varchar(50),
	state varchar(50),
	city_name varchar(50),
	Latitutde Decimal (8,3),
	Longitutde Decimal (8,3),
	Populaiton int,
	Household int,
	Median_income int
	
	
	
);


CREATE TABLE DWH_Dim_prodcuts (
    Product_ID VARCHAR(50) PRIMARY KEY, 
	Product_Name  VARCHAR(50) Not Null,
    category_ID VARCHAR(50),
	category_Name VARCHAR(50),
    Unit_Price INT,
	unit_Cost INT
);

CREATE TABLE DWH_Fact_sales(
	Order_ID VARCHAR(50),
	Location_ID  VARCHAR(50), 
	OrderDate_ID INT,
	Product_ID VARCHAR(50),
	Customer_ID VARCHAR(50),
	SalePerson_ID VARCHAR(50),
	Quantity INT,
	Unit_Price DECIMAL(5,2),
	Sales INT,
	Unit_Cost DECIMAL(5,2),
	Discount INT,
	Taxes DECIMAL(5,2),
	Revanue DECIMAL(5,2)
);

CREATE TABLE DWH_Fact_Monthtly_Target(
	Date_ID INT,
	Location_ID INT,
	Year INT,
	Month INT,
	Sales_Target INT,
	Monthly_Target INT
);






