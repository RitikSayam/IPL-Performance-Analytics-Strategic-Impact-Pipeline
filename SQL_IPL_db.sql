CREATE DATABASE ipl_db;

USE ipl_db;

-- 1. Parent Table: matches
CREATE TABLE IF NOT EXISTS matches (
    match_id INT PRIMARY KEY,
    season VARCHAR(20),
    city VARCHAR(100),
    date VARCHAR(20),
    match_type VARCHAR(50),
    player_of_match VARCHAR(100),
    venue VARCHAR(150),
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    toss_decision VARCHAR(50),
    winner VARCHAR(100),
    result VARCHAR(50),
    result_margin VARCHAR(50),
    target_runs VARCHAR(50),
    target_overs VARCHAR(50),
    super_over VARCHAR(10),
    method VARCHAR(50),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100)
);

-- 2. Child Table: deliveries (with Foreign Key)
CREATE TABLE IF NOT EXISTS deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    inning INT,
    batting_team VARCHAR(100),
    bowling_team VARCHAR(100),
    `over` INT,
    ball INT,
    batter VARCHAR(100),
    bowler VARCHAR(100),
    non_striker VARCHAR(100),
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    extras_type VARCHAR(50),
    is_wicket INT,
    player_dismissed VARCHAR(100),
    dismissal_kind VARCHAR(100),
    fielder VARCHAR(100),
    CONSTRAINT fk_deliveries_matches 
        FOREIGN KEY (match_id) REFERENCES matches(match_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SET GLOBAL local_infile = 1;

-- 1. Load matches.csv FIRST
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- 2. Load deliveries.csv SECOND
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/deliveries.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(match_id, inning, batting_team, bowling_team, `over`, ball, batter, bowler, non_striker, batsman_runs, extra_runs, total_runs, extras_type, is_wicket, player_dismissed, 
dismissal_kind, fielder);

