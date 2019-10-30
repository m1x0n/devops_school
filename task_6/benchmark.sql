SELECT BENCHMARK(1000000, (SELECT SUM(count_gender_total) FROM demographic_stats));
