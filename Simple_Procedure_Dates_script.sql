DROP PROCEDURE Dim_Dates_5
use Simple

Create PROCEDURE Dim_Dates_5
AS
Begin

declare @MaxDate date = '2019-12-31'
declare @MinDate date = '2017-01-01'

DROP TABLE IF EXISTS DWH_Dim_Dates

create table DWH_Dim_Dates(
Date_ID int,
Full_Date Date,
Week_Day varchar(10),
Month_ID int,
Month_Desc varchar(10),
Calendar_Month_Desc varchar(20),
Year int, 
Quarter_ID int,
Quarter_Desc Char(2),
Calendar_Quarter_Desc Char(20),
Current_Month_Ind Bit,
Current_Year_Ind int,
YTD_Ind Bit,
MTD_Ind Bit
);

while @MinDate <= @MaxDate

	begin
		insert into DWH_Dim_Dates(Date_ID, Full_Date,Week_Day,Month_ID,Month_Desc,Calendar_Month_Desc,Year,Quarter_ID,Quarter_Desc,Calendar_Quarter_Desc,Current_Month_Ind,Current_Year_Ind,YTD_Ind,MTD_Ind)
		values(cast(format(@MinDate,'yyyyMMdd') as int),
		format(@MinDate,'yyyy-MM-dd'),
		format(@MinDate,'dddd'),
		convert(int,Month(@MinDate)),
		format(@MinDate, 'MMMM'),
		--format(@MinDate, 'MMMM')+' '+convert(varchar,year(@MinDate)),
		cast(FORMAT(@MinDate,'MMMM') as varchar)+ ' '+ cast(year(@MinDate) as varchar) ,
		year(@MinDate),
		datepart(quarter, @MinDate),
		'Q' + convert(varchar,datepart(quarter, @MinDate)),
		'Q' + convert(varchar,datepart(quarter, @MinDate))+' - '+convert(varchar,year(@MinDate) ),
		case --current month ind
		 when month(@MinDate)= 3 and year(@minDate)= '2019' then 1 
		 else 0
		 end,
		 CASE --current year ind
		 when year(@MinDate)=year(@MaxDate)then 1 
		 when year(@MinDate)= '2018' then 2
		 else 0
		 end,
		   CASE -- YTD_ind
		 when month(@MinDate)<3 or  month(@minDate)=3 and day(@MinDate)<=15 then 1
		 else 0
		 end,
			CASE --MTD_ind
		 when month(@MinDate)=3 and day(@MinDate)<=15 then 1
		 else 0
		 end
		)
		
		set @MinDate = dateadd(day,1,@MinDate)
	End

End
exec Dim_Dates_5

SELECT * FROM DWH_Dim_Dates