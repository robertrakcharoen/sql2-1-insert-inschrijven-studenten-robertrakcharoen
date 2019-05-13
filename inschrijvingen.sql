INSERT INTO klassen (klas_code, slb_code, cohort) VALUES
	('lo9e-amo1','crk01', 2019),
    ('lo9e-amo2','crk02', 2019),
    ('lo9e-amo3','crk03', 2019);
    
INSERT INTO studenten (ov_nummer, geboortedatum, postcode, gewicht, lengte) VALUES
	(92514,'2002-02-25', '4578 BN', 80, 1.79),
    (95987,'1997-04-02', '2496 FN', 74, 1.86),
    (91458,'1999-09-01', '2475 LN', 66, 1.65),
    (99735,'1995-05-20', '1985 RN', 59, 1.71);
    
INSERT INTO klassen_studenten (ov_nummer, klas_code) VALUES
	(92514,'lo9e-amo1'),
    (95987,'lo9e-amo1'),
    (91458,'lo9e-amo2'),
    (99735,'lo9e-amo3');
    
UPDATE studenten
SET
	geboortedatum = '2001-02-25'
WHERE
	ov_nummer = 92514;
    
UPDATE studenten
SET
	actief = FALSE
WHERE
	inschrijvings_datum < '2017-01-01';
    
USE `lo8e_sql2`;
SELECT studenten.ov_nummer, studenten.voornaam, studenten.achternaam, klassen_studenten.klas_code, klassen.cohort,
		CONCAT(docenten.voorletters, docenten.tussenvoegsel, docenten.achternaam) AS volledigenaam
FROM studenten
LEFT JOIN klassen_studenten
ON studenten.ov_nummer = klassen_studenten.ov_nummer
LEFT JOIN klassen
ON klassen.klas_code = klassen_studenten.klas_code
LEFT JOIN docenten
ON docenten.docent_code = klassen.slb_code;


	
