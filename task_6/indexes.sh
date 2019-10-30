#!/usr/bin/env bash


pt-online-schema-change --alter "ADD INDEX stats_idx (count_male, count_female, count_pacific_islander, count_hispanic_latino, count_american_indian, count_asian_non_hispanic, count_white_non_hispanic, count_black_non_hispanic, count_other_ethnicity, count_permanent_resident_alien, count_us_citizen, count_other_citizen_status, count_receives_public_assistance, count_nreceives_public_assistance)" D=stats,t=demographic_stats,h=127.0.0.1,P=3307,u=root,p=example --execute
