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

select * from nflgame_2014_full_year;
analyze nflgame_2014_full_year;

create table NFLGAME_2009_FULL_YEAR (
 NAME varchar(25),
 ID varchar(10),
 TEAM char(5),
 POS char(5),
 YEAR integer,
 PRIMARY KEY (name,id,year)
);

select 
a.name as "2014 RB",
a.pos,
b.name as "2009 RB",
b.pos
from nflgame_2014_full_year a
full outer join nflgame_2009_full_year b 
on a.name = b.name 
and a.id = b.id
;

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
select * into nflgame_rushing_fact_tbl from 
(
select
a.player,
a.year,
a.week,
b.pos,
case
 when rushing_yds = 0 and rushing_att = 0 and rushing_tds = 0 
  then 0
 else 1
end weeks_played,
a.rushing_att,
a.rushing_yds,
a.rushing_tds
from nflgame_rushing a
inner join nflgame_2014_full_year b
on a.player = b.name 
and a.team = b.team
where a.year in (2012,2013,2014)
and b.pos in ('RB')
--and weeks_played >= 13
and rushing_yds > 0 and rushing_att > 0 and rushing_tds > 0
--order by 6 desc,7 desc,8 desc
) a;


select
a.player,
b.pos,
corr(rushing_att,rushing_tds) corr_att_to_tds,
corr(rushing_yds,rushing_tds) corr_yds_to_tds,
sum(
 case
  when rushing_yds = 0 and rushing_att = 0 and rushing_tds = 0 then 0
   else 1
 end)/3 weeks_played,
cast(avg(rushing_att) as DECIMAL(6,2)) avg_rushing_atts,
cast(avg(rushing_yds) as DECIMAL(6,2)) avg_rushing_yards,
cast(avg(rushing_tds) as DECIMAL(6,2)) avg_rushing_tds,
cast(avg(rushing_yds) as DECIMAL(8,2)) / cast(avg(rushing_tds) as DECIMAL(8,2)) "rushing_yds_ratio",
cast(avg(rushing_att) as DECIMAL(6,2)) / cast(avg(rushing_tds) as DECIMAL(6,2)) "rushing_att_ratio"
from nflgame_rushing a
inner join nflgame_2014_full_year b
on a.player = b.name 
and a.team = b.team
where a.year in (2012,2013,2014)
and b.pos in ('RB')
--and weeks_played >= 13
group by a.player,b.pos
having sum(rushing_yds) > 0 and sum(rushing_att) > 0 and sum(rushing_tds) > 0
order by 6 desc
limit 50
;

select 
player,
sum(rushing_tds) 
from nflgame_rushing_fact_tbl
where year in (2014)
group by 1
having sum(rushing_yds) > 0 and sum(rushing_att) > 0 and sum(rushing_tds) > 0
order by 2 desc
limit 30
;

-- how many weeks did you play
select
sum(
 case
  when rushing_yds = 0 and rushing_att = 0 and rushing_tds = 0 then 0
   else 1
 end) weeks_played
from nflgame_rushing
where player in ('A.Foster')
and year in (2014)
;

select
player,
sum(rushing_tds) rushing_tds
from nflgame_rushing_fact_tbl

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


