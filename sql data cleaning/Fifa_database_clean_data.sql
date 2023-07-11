CREATE TABLE IF NOT EXISTS match_details (
  ID varchar(50) NOT NULL,
  Home varchar(255) NOT NULL,
  Away varchar(255) NOT NULL,
  Stage varchar(255) NOT NULL,
  Scorer varchar(255) NOT NULL,
  ScoringTeam varchar(255) NOT NULL,
  Type varchar(255) NOT NULL
) ;
-- i have imported the data successfully
select * from match_details

-- delete first row because when i imported 

delete from match_details where id='ID'

-- remove duplicates
-- there is 7 duplicate 
select id,count(id) as count_id from match_details group by id having count(id) > 1;

-- now let's remove the duplicate by creating a distinct table from orginial table

CREATE TABLE non_dup_match_details AS
SELECT DISTINCT * FROM match_details;

-- let's delete old table because we don't need that.

drop table match_details;

-- select the data

select * from non_dup_match_details;

-- rename the newly created table

alter table non_dup_match_details rename to match_details;

-- select again

select * from match_details;

-- let's check if there is any null values present this dataset

select id from match_details where id is Null;

-- there is no null value

----------------------------------------------------------------------------------------------------------------

-- show the scorer name and how many goals they have scored 
-- then store that data into another table called scorer

create table scorer as select scorer, count(scorer)
from match_details group by scorer;

-- select the table

select * from scorer;


