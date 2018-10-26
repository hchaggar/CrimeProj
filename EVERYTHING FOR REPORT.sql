/*==================================================
	CLEANING CrimeDataNew TO JUST LONDON CRIMES
====================================================
Started with the crime data. Wanted to filter to just London data. So I inner joined a table of just London boroughs and LSOA codes to match only the crimes in the crime table that matched LSOA codes with the London
borough tables.
I have also filter the crime date as I only want this data between 2012 and 2016 as that is the time-frame of my train data. Also, there were some crimes without 'Reported By' data, so I removed these entries.
I also wanted a new column for CrimeID to remove the long and complicated original CrimeIDs.
Then split the Month column into Year and Month separately, and made this into a new table, LondonCrimeData = 5,111,077 rows
(Still 334 rows not in London)
*/

	if OBJECT_ID('dbo.LondonCrimeData') is not null
	begin
		drop table dbo.LondonCrimeData
	end
	go
	
	select
		identity(int) [CrimeID]
		,left(c.[Month],4) [Crime Year]
		,right(c.[Month],2) [Crime Month]
		,c.[Reported by]
		,c.Longitude
		,c.Latitude
		,c.[LSOA code] [Crime LSOA code]
		,c.[LSOA name] [Crime LSOA name]
		,b.LAD11CD [Crime LAD code]
		,b.LAD11NM [Crime LAD name]
		,c.[Crime type]
	into dbo.LondonCrimeData
	from [dbo].[CrimeDataNew] c
	
	inner join [dbo].[LondonBoroughLSOAcodes] b
		on b.LSOA11CD = c.[LSOA code]

	where [Month] between '2012-01' and '2016-12'
	and [Reported by] <> ''

	order by [Crime Year], [Crime Month]


/*
I then moved the original crime table to the trash schema
*/

	alter schema trash
	transfer [dbo].[CrimeDataNew2]


/*===========================================================
	CLEANING LondonStationPostcodes TO MATCH TRAIN TABLES
=============================================================
To be able to add postcodes to the train tables (for the purpose of joining again to get LSOA codes of the train stations), we needed to match the stations that differed between the 2 tables:
This meant changing 24 train station names in LondonStationPostcodes = 641 rows in LondonStationsPostcodes
*/
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Caledonian Road & Barnsbury'
		where Station = 'Caledonian Road and Barnsbury'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Dalston (Kingsland)'
		where Station = 'Dalston Kingsland'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Elephant & Castle'
		where Station = 'Elephant and Castle'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Finchley Road & Frognal'
		where Station = 'Finchley Road and Frognal'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Harrow & Wealdstone'
		where Station = 'Harrow and Wealdstone'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Hayes & Harlington'
		where Station = 'Hayes and Harlington'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Hayes (Kent)'
		where Station = 'Hayes'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Highbury & Islington'
		where Station = 'Highbury and Islington'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Queen''s Park (Gt London)'
		where Station = 'Queens Park'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Queen''s Road Peckham'
		where Station = 'Queens Road Peckham'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Queenstown Road (Battersea)'
		where Station = 'Queenstown Road'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Rainham (Essex)'
		where Station = 'Rainham'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Reedham (Greater London)'
		where Station = 'Reedham'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.Helier'
		where Station = 'St Helier'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.James'' Street'
		where Station = 'St James Street'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.John''s'
		where Station = 'St Johns'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.Margaret''s (Greater London)'
		where Station = 'St Margarets'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.Mary Cray'
		where Station = 'St Mary Cray'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'St.Pancras'
		where Station = 'St Pancras'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Sudbury & Harrow Road'
		where Station = 'Sudbury and Harrow Road'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Sutton (Surrey)'
		where Station = 'Sutton'
	--rollback tran
	--commit tran
	
	
	begin tran
	update [crime].[dbo].[LondonStationsPostcodes]
		set Station = 'Waterloo (East)'
		where Station = 'Waterloo East'
	--rollback tran
	--commit tran


/*==========================================================================
	JOINED TRAIN TABLES TO GET LSOA AND LAD CODES, AND ADDED YEAR COLUMN
============================================================================
Joined all train tables to tables to include the LSOA code and name and LAD code and name, and added a year column (for unioning all train tables together). I noticed one station (South Greenford) didn't match to the
PostcodeToLSOA table as the postcode didn't exist in that table, so I removed this row, and put this into a new table, CleanTrain[Year]
*/

	if OBJECT_ID('dbo.[CleanTrain2012-13]') is not null
	begin
		drop table dbo.[CleanTrain2012-13]
	end
	go
	
	select
		t.[Station Name]
		,ptl.lsoa11cd [LSOA Code]
		,ptl.lsoa11nm [LSOA Name]
		,b.LAD11CD [LAD Code]
		,b.LAD11NM [LAD Name]
		,p.Latitude
		,p.Longitude
		,'2012' [Year]
		,t.[1213 Entries & Exits] [Total Usage]
		,p.Zone
	into [CleanTrain2012-13]
	from [dbo].[Train12-13] t
	
	left join [dbo].[LondonBoroughLSOAcodes] b
	on b.LAD11NM = t.[District or Unitary Authority]
	
	left join [dbo].[LondonStationsPostcodes] p
		on p.[Station] = t.[Station Name]
	
	left join [dbo].[PostcodeToLSOA] ptl
		on ptl.pcds = p.Postcode
	
	where t.[Government Office Region (GOR)] = 'London'
	and lsoa11cd is not null
--=328 rows


	if OBJECT_ID('dbo.[CleanTrain2013-14]') is not null
	begin
		drop table dbo.[CleanTrain2013-14]
	end
	go
	
	select
		t.[Station Name]
		,ptl.lsoa11cd [LSOA Code]
		,ptl.lsoa11nm [LSOA Name]
		,b.LAD11CD [LAD Code]
		,b.LAD11NM [LAD Name]
		,p.Latitude
		,p.Longitude
		,'2013' [Year]
		,t.[1314 Entries & Exits] [Total Usage]
		,p.Zone
	into [CleanTrain2013-14]
	from [dbo].[Train13-14] t
	
	left join [dbo].[LondonBoroughLSOAcodes] b
	on b.LAD11NM = t.[District or Unitary Authority]
	
	left join [dbo].[LondonStationsPostcodes] p
		on p.[Station] = t.[Station Name]
	
	left join [dbo].[PostcodeToLSOA] ptl
		on ptl.pcds = p.Postcode
	
	where t.[Government Office Region (GOR)] = 'London'
	and lsoa11cd is not null
--=328 rows


	if OBJECT_ID('dbo.[CleanTrain2014-15]') is not null
	begin
		drop table dbo.[CleanTrain2014-15]
	end
	go
	
	select
		t.[Station Name]
		,ptl.lsoa11cd [LSOA Code]
		,ptl.lsoa11nm [LSOA Name]
		,b.LAD11CD [LAD Code]
		,b.LAD11NM [LAD Name]
		,p.Latitude
		,p.Longitude
		,'2014' [Year]
		,t.[1415 Entries & Exits] [Total Usage]
		,p.Zone
	into [CleanTrain2014-15]
	from [dbo].[Train14-15] t
	
	left join [dbo].[LondonBoroughLSOAcodes] b
	on b.LAD11NM = t.[District or Unitary Authority]
	
	left join [dbo].[LondonStationsPostcodes] p
		on p.[Station] = t.[Station Name]
	
	left join [dbo].[PostcodeToLSOA] ptl
		on ptl.pcds = p.Postcode
	
	where t.[Government Office Region (GOR)] = 'London'
	and lsoa11cd is not null
--=328 rows


-------First had to clean Train15-16 as the London stations all had (London) at the end of the Local Authority names and would not match the LondonBoroughLSOAcodes table. So changed the Local Authority column:
	if OBJECT_ID('dbo.[LACleanTrain15-16]') is not null
	begin
		drop table dbo.[LACleanTrain15-16]
	end
	go
	
	select
		*
		,replace([Local Authority],' (London)','') [Clean LA]
	into [dbo].[LACleanTrain15-16]
	from [crime].[dbo].[Train15-16]
-------and also had to change the Clean LA of City of London and Westminster to match the LondonBoroughLSOAcodes table:
	begin tran
	update [dbo].[LACleanTrain15-16]
		set [Clean LA] = 'City of London'
		where [Clean LA] = 'City and County of the City of London'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[LACleanTrain15-16]
		set [Clean LA] = 'Westminster'
		where [Clean LA] = 'City of Westminster'
	--rollback tran
	--commit tran
-------and put this table with this cleaned Local Authority column into a new table CleanLATrain15-16
-------Repeated this for Train16-17


	if OBJECT_ID('dbo.[CleanTrain2015-16]') is not null
	begin
		drop table dbo.[CleanTrain2015-16]
	end
	go
	
	select
		t.[Station Name]
		,ptl.lsoa11cd [LSOA Code]
		,ptl.lsoa11nm [LSOA Name]
		,b.LAD11CD [LAD Code]
		,b.LAD11NM [LAD Name]
		,p.Latitude
		,p.Longitude
		,'2015' [Year]
		,t.[1516 Entries & Exits] [Total Usage]
		,p.Zone
	into [CleanTrain2015-16]
	from [dbo].[LACleanTrain15-16] t
	
	left join [dbo].[LondonBoroughLSOAcodes] b
	on b.LAD11NM = t.[Clean LA]
	
	left join [dbo].[LondonStationsPostcodes] p
		on p.[Station] = t.[Station Name]
	
	left join [dbo].[PostcodeToLSOA] ptl
		on ptl.pcds = p.Postcode
	
	where t.[Region] = 'London'
	and lsoa11cd is not null
	and Entries_Total is not null
--=328 rows (removed Heathrow Terminal 4 and Heathrow Terminal 5 as there was no usage data)


	if OBJECT_ID('dbo.[CleanTrain2016-17]') is not null
	begin
		drop table dbo.[CleanTrain2016-17]
	end
	go
		
	select
		t.[Station Name]
		,ptl.lsoa11cd [LSOA Code]
		,ptl.lsoa11nm [LSOA Name]
		,b.LAD11CD [LAD Code]
		,b.LAD11NM [LAD Name]
		,p.Latitude
		,p.Longitude
		,'2016' [Year]
		,t.[1617 Entries & Exits] [Total Usage]
		,p.Zone
	into [CleanTrain2016-17]
	from [dbo].[LACleanTrain16-17] t
	
	left join [dbo].[LondonBoroughLSOAcodes] b
	on b.LAD11NM = t.[Clean LA]
	
	left join [dbo].[LondonStationsPostcodes] p
		on p.[Station] = t.[Station Name]
	
	left join [dbo].[PostcodeToLSOA] ptl
		on ptl.pcds = p.Postcode
	
	where t.[Region] = 'London'
	and lsoa11cd is not null
	and [Station Name] <> 'Lea Bridge'
--=328 rows (removed Lea Bridge as this was a new station in 2016 and would not match with previous train data)


/*========================================
	UNIONING TRAIN TABLES AND CLEANING
==========================================
Then unioned all train tables, remaned the columns for clarity, and put this into a new table, TrainDataComplete = 1,640 rows
*/

	if OBJECT_ID('dbo.[TrainDataComplete]') is not null
	begin
		drop table dbo.[TrainDataComplete]
	end
	go
	
	;with cte1
	as
	(
	select * from [dbo].[CleanTrain2012-13]
	union
	select * from [dbo].[CleanTrain2013-14]
	union
	select * from [dbo].[CleanTrain2014-15]
	union
	select * from [dbo].[CleanTrain2015-16]
	union
	select * from [dbo].[CleanTrain2016-17]
	--order by [Station Name], [year]
	)
	
	select
		[Station Name]
		,[LSOA Code] [Train LSOA code]
		,[LSOA Name] [Train LSOA name]
		,[LAD Code] [Train LAD code]
		,[LAD Name] [Train LAD name]
		,Latitude
		,Longitude
		,[Year] [Train Usage Year]
		,[Total Usage]
		,[Zone]
	into dbo.[TrainDataComplete]
	from cte1
	order by [Station Name],[Train Usage Year]


/*
Noticed there were 9 stations with the same LSOA codes/names, but different LAD names/codes (see code file for details on each station)
Decided to change the LAD code/names to match the LSOA code/names
*/

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Greenwich',
			[Train LAD code] = 'E09000011'
		where [Station Name] = 'Abbey Wood'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Hammersmith and Fulham',
			[Train LAD code] = 'E09000013'
		where [Station Name] = 'Kensington Olympia'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Lewisham',
			[Train LAD code] = 'E09000023'
		where [Station Name] = 'New Cross'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Islington',
			[Train LAD code] = 'E09000019'
		where [Station Name] = 'Old Street'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Hammersmith and Fulham',
			[Train LAD code] = 'E09000013'
		where [Station Name] = 'Shepherds Bush'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Hackney',
			[Train LAD code] = 'E09000012'
		where [Station Name] = 'Shoreditch High Street'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Hackney',
			[Train LAD code] = 'E09000012'
		where [Station Name] = 'Stamford Hill'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Kensington and Chelsea',
			[Train LAD code] = 'E09000020'
		where [Station Name] = 'West Brompton'
	--rollback tran
	--commit tran

	begin tran
	update [dbo].[TrainDataComplete]
		set [Train LAD name] = 'Brent',
			[Train LAD code] = 'E09000005'
		where [Station Name] = 'Willesden Junction'
	--rollback tran
	--commit tran


/*=========================================
	USING ALTERYX TO FIND SPATITAL DATA
===========================================
For my analysis I wanted to find the closest train station to the crime using longitudes and latitudes. However, as the crime table is very large, it was impractical to perform this in SQL, so I used the crime
and train tables in Alteryx with the 'Find Nearest' function to efficiently find the nearest train station to each crime. I imported this back into SQL as CrimeTrainCombined.
The CrimeID column was changed into a string during this process, so I changed this column back into an integer after the data was imported:
*/

	alter table [dbo].[CrimeTrainCombined]
	alter column CrimeID int not null


--Then added LSOA population for train info into CrimeTrainPop, and train zone info (see separate queries) into CrimeTrainCombined2 and CrimeTrainPop2


/*==================================================
	MAKING DIM TABLES, FACT TABLE AND MAIN TABLE
====================================================
*/

-------Make DimPolice table
	if object_id('DimPolice') is not null
	begin
		drop table DimPolice
	end
	go
	
	select distinct
		isnull([Reported by],'Unknown') [PoliceConstabulary]
	into DimPolice
	from [dbo].[CrimeTrainPop2]
	
	alter table DimPolice
	add PoliceID tinyint identity primary key
	
	
	select
	*
	from DimPolice


-------Make DimGeo table
	if object_id('DimGeo') is not null
	begin
		drop table DimGeo
	end
	go
	
	select
		isnull(LSOA11CD,'Unknown') [LSOA code]
		,isnull(LSOA11NM,'Unknown') [LSOA name]
		,isnull(LAD11CD,'Unknown') [LAD code]
		,isnull(LAD11NM,'Unknown') [LAD name]
	into DimGeo
	from [dbo].[LondonBoroughLSOAcodes]
	
	alter table DimGeo
	add LSOAID int identity primary key
	
	--insert into [dbo].[DimGeo] ([LSOA code],[LSOA name],[LAD code],[LAD name])
	--values ('E01024439','Sevenoaks 008C','E09000006','Bromley')
	
	
	select
	*
	from DimGeo


-------Make DimCrimeType table
	if object_id('DimCrimeType') is not null
	begin
		drop table DimCrimeType
	end
	go
	
	select distinct
		isnull([Crime type],'Unknown') [Crime type]
	into DimCrimeType
	from [dbo].[CrimeTrainPop2]
	
	alter table DimCrimeType
	add CrimeTypeID tinyint identity primary key
	
	
	select
	*
	from DimCrimeType


-------Make DimStation table
	if object_id('DimStation') is not null
	begin
		drop table DimStation
	end
	go
	
	select distinct
		isnull([Station Name],'Unknown') [Station Name]
		,isnull(Latitude,'Unknown') [Station Latitude]
		,isnull(Longitude,'Unknown') [Station Longitude]
		,isnull(Zone,'Unknown') [Train Zone]
	into DimStation
	from [dbo].[TrainDataComplete]
	
	alter table DimStation
	add StationID int identity primary key
	
	
	select
	*
	from DimStation


-------Joining Dim tables
	if object_id('FactTable1') is not null
	begin
		drop table FactTable1
	end
	go
	
	select
		c.CrimeID
		,d.[year] [Crime Year]
		,d.[month] [Crime Month]
		,p.PoliceID
		,c.Longitude [Crime Longitude]
		,c.Latitude [Crime Latitude]
		,g.LSOAID [CrimeLSOAID]
		,ct.CrimeTypeID
		,s.StationID
		,gg.LSOAID [TrainLSOAID]
		,c.DistanceKilometers
		,dd.[year] [Train Usage Year]
		,c.[Total Usage]
	into FactTable1
	from [crime].[dbo].[CrimeTrainCombined] c
	
	inner join kubrick.dbo.DimDate d
		on cast(c.[Crime Year] + '-' + c.[Crime Month] + '-01' as date) = d.dt
	
	inner join DimPolice p
		on c.[Reported by] = p.PoliceConstabulary
	
	inner join DimGeo g
		on c.[Crime LSOA code] = g.[LSOA code]
	
	inner join DimCrimeType ct
		on c.[Crime type] = ct.[Crime type]
	
	inner join DimStation s
		on c.[Station Name] = s.[Station Name]
	
	inner join DimGeo gg
		on c.[Train LSOA code] = gg.[LSOA code]
	
	inner join kubrick.dbo.DimDate dd
		on cast(c.[Train Usage Year] as date) = dd.dt


-------Making FactTable1 into a view
	create view vw_MainTable1
	as
	select
		f.CrimeID
		,f.[Crime Year]
		,f.[Crime Month]
		,p.PoliceConstabulary
		,f.[Crime Longitude]
		,f.[Crime Latitude]
		,g.[LSOA code] [Crime LSOA code]
		,g.[LSOA name] [Crime LSOA name]
		,g.[LAD code] [Crime LAD code]
		,g.[LAD name] [Crime LAD name]
		,ct.[Crime type]
		,s.[Station Name]
		,s.[Station Longitude]
		,s.[Station Latitude]
		,s.[Train Zone]
		,gg.[LSOA code] [Train LSOA code]
		,gg.[LSOA name] [Train LSOA name]
		,gg.[LAD code] [Train LAD code]
		,gg.[LAD name] [Train LAD name]
		,f.[Train Usage Year]
		,f.[Total Usage]
	from FactTable1 f
	
	inner join DimPolice p
		on f.PoliceID = p.PoliceID
	
	inner join DimGeo g
		on f.CrimeLSOAID = g.LSOAID
	
	inner join DimCrimeType ct
		on f.CrimeTypeID = ct.CrimeTypeID
	
	inner join DimStation s
		on f.StationID = s.StationID
	
	inner join DimGeo gg
		on f.TrainLSOAID = gg.LSOAID