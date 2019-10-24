SET GLOBAL local_infile = 'ON';

CREATE DATABASE `stats`;

CREATE TABLE `stats`.`demographic_stats` (
  `jurisdiction_number` INT NOT NULL PRIMARY KEY,
  `count_participants` INT,
  `count_female` INT,
  `percent_female` DOUBLE,
  `count_male` INT,
  `percent_male` DOUBLE,
  `count_gender` INT,
  `percent_gender` DOUBLE,
  `count_gender_total` INT,
  `percent_gender_total` DOUBLE,
  `count_pacific_islander` INT,
  `percent_pacific_islander` DOUBLE,
  `count_hispanic_latino` INT,
  `percent_hispanic_latino` DOUBLE,
  `count_american_indian` INT,
  `percent_american_indian` DOUBLE,
  `count_asian_non_hispanic` INT,
  `percent_asian_non_hispanic` DOUBLE,
  `count_white_non_hispanic` INT,
  `percent_white_non_hispanic` DOUBLE,
  `count_black_non_hispanic` INT,
  `percent_black_non_hispanic` DOUBLE,
  `count_other_ethnicity` INT,
  `percent_other_ethnicity` DOUBLE,
  `count_ethnicity` INT,
  `percent_ethnicity` DOUBLE,
  `count_ethnicity_total` INT,
  `percent_ethnicity_total` DOUBLE,
  `count_permanent_resident_alien` INT,
  `percent_permanent_resident_alien` INT,
  `count_us_citizen` INT,
  `percent_us_citizen` DOUBLE,
  `count_other_citizen_status` INT,
  `percent_other_citizen_status` DOUBLE,
  `count_citizen_status` INT,
  `percent_citizen_status` DOUBLE,
  `count_citizen_status_total` INT,
  `percent_citizen_status_total` DOUBLE,
  `count_receives_public_assistance` INT,
  `percent_receives_public_assistance` DOUBLE,
  `count_nreceives_public_assistance` INT,
  `percent_nreceives_public_assistance` DOUBLE,
  `count_public_assistance` INT,
  `percent_public_assistance` DOUBLE,
  `count_public_assistance_total` INT,
  `percent_public_assistance_total` DOUBLE
) ENGINE=InnoDB;

LOAD DATA INFILE '/var/lib/mysql-files/stats.csv' INTO TABLE `stats`.`demographic_stats` FIELDS TERMINATED BY ',' IGNORE 1 LINES;

SET GLOBAL local_infile = 'OFF';
