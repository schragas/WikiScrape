DROP TABLE gold1, silver1, bronze1;
CREATE TEMPORARY TABLE gold1(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NOC VARCHAR(255),
	Gold INTEGER(10)
);
INSERT INTO gold1 (NOC, Gold)
SELECT NOC, Gold
FROM medalcount
ORDER BY Gold desc, NOC asc;

CREATE TEMPORARY TABLE silver1(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NOC VARCHAR(255),
	Silver INTEGER(10)
    
);
INSERT INTO silver1 (NOC, Silver)
SELECT NOC, Silver
FROM medalcount
ORDER BY Silver desc, NOC asc;
CREATE TEMPORARY TABLE bronze1(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NOC VARCHAR(255),
	Bronze INTEGER(10)
);
INSERT INTO bronze1 (NOC, Bronze)
SELECT NOC, Bronze
FROM medalcount
ORDER BY Bronze desc, NOC asc;

SELECT gold1.id as "Rank",gold1.NOC as "Gold", silver1.NOC as "Silver", bronze1.NOC as "Bronze"
FROM gold1,silver1,bronze1
WHERE gold1.id = silver1.id AND silver1.id = bronze1.id
