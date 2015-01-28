create table NFLGAME_2014_FULL_YEAR (
 NAME varchar(20),
 ID varchar(10),
 TEAM char(5),
 POS char(5),
 PRIMARY KEY (ID)
);

create view nflgame_2014_full_year_v as (
select *
from nflgame_2014_full_year
)
;

select * from nflgame_2014_full_year_v;
analyze nflgame_2014_full_year;

-----------------------------------------------------
-- ALL PLAYER
-----------------------------------------------------
-- Use this table to find positions
-- join on name to player

select * from nflgame_2014_full_year;

-----------------------------------------------------
-- RUSHING
-----------------------------------------------------

delete from nflgame_rushing;
drop table nflgame_rushing;

create table NFLGAME_RUSHING (
 PLAYER varchar(25),
 YEAR integer,
 WEEK integer,
 TEAM char(5),
 HOME char(5),
 RUSHING_ATT integer,
 RUSHING_LNG integer,
 RUSHING_LNGTD integer,
 RUSHING_TDS integer,
 RUSHING_TWOPA integer,
 RUSHING_TWOPTM integer,
 RUSHING_TWOPTMISSED integer,
 RUSHING_YDS integer,
 PRIMARY KEY (PLAYER,YEAR,WEEK,TEAM)
);

analyse nflgame_rushing;

select * from nflgame_rushing order by rushing_yds desc;
select max(week) from nflgame_rushing where year in (2014);
select * from nflgame_rushing where year in (2014);

select 
year,
count(*) the_count
from nflgame_rushing
group by 1
order by 1 asc
;

select
player,
avg(rushing_yds) avg_rushing_yds,
avg(rushing_tds) avg_rushing_tds
from nflgame_rushing
where year in (2014)
group by 1
order by 2 desc
;

select
week,
rushing_yds,
rushing_tds
from nflgame_rushing
where player in ('D.Murray')
and year in (2014)
order by 1
;

-----------------------------------------------------
-- PASSING
-----------------------------------------------------

delete from nflgame_passing;
drop table nflgame_passing;

create table NFLGAME_PASSING (
 PLAYER varchar(25),
 YEAR integer,
 WEEK integer,
 TEAM char(5),
 HOME char(5),
 PASSING_ATT integer,
 PASSING_CMP integer,
 PASSING_CMP_AIR_YDS integer,
 PASSING_INCMP integer,
 PASSING_INCMP_AIR_YDS integer,
 PASSING_INT integer,
 PASSING_INTS integer,
 PASSING_SK integer,
 PASSING_SK_YDS integer,
 PASSING_TDS integer,
 PASSING_TWOPTA integer,
 PASSING_TWOPTM integer,
 PASSING_TWOPTMISSED integer,
 PASSING_YDS integer,
 PRIMARY KEY (PLAYER,YEAR,WEEK,TEAM)
);

analyse nflgame_passing;
select max(week) from nflgame_passing where year in (2010);

select 
year,
count(*) the_count
from nflgame_passing
group by 1
order by 1
;

--------------------------------------------------------------
-- RECEIVING
--------------------------------------------------------------

delete from nflgame_receiving;
drop table nflgame_receiving;

create table NFLGAME_RECEIVING (
 PLAYER varchar(25),
 YEAR integer,
 WEEK integer,
 TEAM char(5),
 HOME char(5),
 RECEIVING_LNG integer,
 RECEIVING_LGNTD integer,
 RECEIVING_REC integer,
 RECEIVING_TAR integer,
 RECEIVING_TDS integer,
 RECEIVING_TWOPTA integer,
 RECEIVING_TWOPTM integer,
 RECEIVING_TWOPTMISSED integer,
 RECEIVING_YAC_YDS integer,
 RECEIVING_YDS integer,
 PRIMARY KEY (PLAYER,YEAR,WEEK,TEAM)
);

select * from nflgame_receiving;
select * from nflgame_receiving where year in (2012) and player in ('D.Bryant');

select
year,
count(*) the_count
from nflgame_receiving
group by 1
order by year
;


