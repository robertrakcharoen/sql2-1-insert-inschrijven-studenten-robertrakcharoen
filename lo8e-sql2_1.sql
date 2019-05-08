DROP DATABASE IF EXISTS `lo8e_sql2`;
CREATE DATABASE `lo8e_sql2` DEFAULT CHARACTER SET utf8;
USE `lo8e_sql2`;

CREATE TABLE `opleidingen` (
	`opleiding_code` VARCHAR(3) NOT NULL,
	`titel` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`opleiding_code`)
);

CREATE TABLE `docenten` (
  `docent_code` varchar(10) NOT NULL,
  `voorletters` varchar(10) DEFAULT NULL,
  `tussenvoegsel` varchar(10) DEFAULT NULL,
  `achternaam` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`docent_code`)
) ;

CREATE TABLE `klassen` (
  `klas_code` varchar(10) NOT NULL,
  `slb_code` varchar(10) DEFAULT NULL,
  `cohort` int(4) NOT NULL,
  `opleiding_code` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`klas_code`)
);

CREATE TABLE `studenten` (
  `ov_nummer` int(11) NOT NULL,
  `achternaam` varchar(50) DEFAULT NULL,
  `tussenvoegsel` varchar(10) DEFAULT NULL,
  `voorletters` varchar(10) DEFAULT NULL,
  `voornaam` varchar(20) DEFAULT NULL,
  `geboortedatum` datetime DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `plaats` varchar(30) DEFAULT NULL,
  `gewicht` decimal(3,1) DEFAULT NULL,
  `lengte` decimal(3,2) DEFAULT NULL,
  `actief` boolean DEFAULT TRUE,
  `inschrijvings_datum` DATE NULL,
  PRIMARY KEY (`ov_nummer`)
);

CREATE TABLE `klassen_studenten` (
  `klas_code` varchar(10) NOT NULL,
  `ov_nummer` int(11) NOT NULL,
  PRIMARY KEY (`klas_code`, `ov_nummer`)
);

CREATE TABLE `vakken` (
	`vak_code` VARCHAR(10) NOT NULL,
    `titel` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`vak_code`)
);

CREATE TABLE `lessen` (
    `klas_code` VARCHAR(10) NOT NULL,
    `jaargang` int(4) NOT NULL,
    `periode` int(1) NOT NULL,
    `weekdag` int(1) NOT NULL,
    `lesuur` INT(1) NOT NULL,
	`docent_code` VARCHAR(10),
    `vak_code` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`klas_code`, `jaargang`, `periode`, `weekdag`, `lesuur`)
);

CREATE TABLE `cijfers` (
    `ov_nummer` INT(11) NOT NULL,
    `vak_code` VARCHAR(10) NOT NULL,
    `jaargang` int(4) NOT NULL,
    `periode` int(1) NOT NULL,
    `poging` int(1) NOT NULL,
    `cijfer` int(2) NOT NULL,
    PRIMARY KEY (`ov_nummer`, `vak_code`, `jaargang`, `periode`, `poging`)
);

ALTER TABLE lessen ADD FOREIGN KEY (klas_code) REFERENCES klassen(klas_code);
ALTER TABLE lessen ADD FOREIGN KEY (docent_code) REFERENCES docenten(docent_code);
ALTER TABLE lessen ADD FOREIGN KEY (vak_code) REFERENCES vakken(vak_code);

ALTER TABLE klassen_studenten ADD FOREIGN KEY (klas_code) REFERENCES klassen(klas_code);
ALTER TABLE klassen_studenten ADD FOREIGN KEY (ov_nummer) REFERENCES studenten(ov_nummer);

ALTER TABLE klassen ADD FOREIGN KEY (slb_code) REFERENCES docenten(docent_code);
ALTER TABLE klassen ADD FOREIGN KEY (opleiding_code) REFERENCES opleidingen(opleiding_code);

ALTER TABLE cijfers ADD FOREIGN KEY (ov_nummer) REFERENCES studenten(ov_nummer);
ALTER TABLE cijfers ADD FOREIGN KEY (vak_code) REFERENCES vakken(vak_code);

INSERT INTO opleidingen(`opleiding_code`, `titel`) VALUES
	('amo', 'Applicatie- en Mediaontwikkelaar');

INSERT INTO docenten(docent_code, voorletters, tussenvoegsel, achternaam) VALUES
	('brc01','J.P.','','Brackenhoff'), 
    ('rs001','H.', 'van', 'Rosendahl'), 
    ('bkr02','F.M.', '', 'Bekerman'), 
    ('vlt03','E.', 'van', 'Vleuten'), 
    ('akr02','M.', '', 'Akerboom');

INSERT INTO klassen
    (klas_code, slb_code, cohort, opleiding_code) VALUES 
	('lo7e-amo1','vlt03', 2017, 'amo'), 
	('lo8e-amo1','vlt03', 2018, 'amo'), 
    ('lo8e-amo2','rs001', 2018, 'amo'), 
    ('lo8e-amo3','bkr02', 2018, 'amo'), 
    ('lo8e-amo4','brc01', 2018, 'amo');
    
INSERT INTO studenten (ov_nummer, achternaam, tussenvoegsel, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, inschrijvings_datum) VALUES
	(86476,'Choo','','Jeremy','1993-07-27','2211 SG','Noordwijkerhout', 73.2, 1.86, 01-01-2018),
	(87956,'Dekkers','','Kenneth','1992-08-05','2152 EX','Nieuw-Vennep', 82.1, 1.87, 01-01-2018),
	(77425,'Geulkes','','Paul','1994-03-26','2465 AG','Rijsaterwoude', 67.0, 1.77, 01-01-2018),
	(85204,'Grommans','','Jim','1993-07-13','2321 HP','Leiden', 72.5, 1.85, 01-01-2018),
	(86043,'Groen','','Luke','1994-07-05','2401 VP','Alphen a/d Rijn', 77.2, 1.86, 01-01-2018),
	(77245,'Haastbroek','','Stefanie','1992-05-26','2211 LK','Noordwijkerhout', 77.9, 1.77, 01-01-2018),
	(79899,'Heemskerken','','Erik','1992-09-09','2231 DG','Rijnsburg', 63.2, 1.79, 01-01-2018),
	(83091,'Hein','','Ruben','1993-09-26','2251 XZ','Voorschoten',  74.0, 1.83, 01-01-2018),
	(85526,'Hoogenelst','','Dylan','1992-12-11','2402 MP','Alphen a/d Rijn', 75.6, 1.85, 01-01-2018),
	(79553,'Martins','','Evander','1992-12-22','2352 KE','Leiderdorp', 79.3, 1.89, 01-01-2018),
	(78854,'Meijs','van der','Mark','1992-09-27','2231 BP','Rijnsburg', 72.9, 1.88, 01-01-2018),
	(78979,'Marauw','','Mike','1993-10-18','2265 EL','Leidschendam', 73.0, 1.78, 01-01-2018),
	(88724,'Nietvelden','','Mitchel','1992-12-14','2421 HR','NIeuwkoop', 73.6, 1.88, 01-01-2018),
	(87165,'Reesink','van','Dennis','1993-06-23','2281 BE','Rijswijk (ZH)', 79.0, 1.87, 01-01-2018),
	(86046,'Rijn','van','Daan','1993-12-29','2376 BA','Nieuwe Wetering', 75.0, 1.86, 01-01-2017),
	(79837,'Rietland','','Pieter','1992-08-27','2156 LB','Weteringbrug', 78.2, 1.79, 01-01-2018),
	(85957,'Roberts','','Timo','1993-09-07','2272 EV','Voorburg', 72.9, 1.85, 01-01-2018),
	(84907,'Rosbief','','Daniel','1994-03-16','2771 MX','Boskoop', 65.3, 1.84, 01-01-2017),
	(83680,'Schopman','','Gavin','1993-11-11','2235 DD','Valkenburg (ZH)', 64.6, 1.83, 01-01-2018),
	(77717,'Stoel','van der','Tobias','1993-06-05','2408 TR','Alphen a/d Rijn', 77.1, 1.77, 01-01-2018),
	(88856,'The','','Lau','1989-11-29','2271 BK','Voorburg', 79.5, 1.88, 01-01-2018),
	(84729,'Veen','van','Melanie','1992-05-22','2353 KE','Leiderdorp', 73.1, 1.84, 01-01-2018),
	(85183,'Blaise','','Pascal','1994-09-20','2431 ZE','Noorden', 74.1, 1.85, 01-01-2018),
	(86521,'Vries','de','Thomas','1993-04-04','2225 LA','Katwijk', 78.3, 1.81, 01-01-2018),
	(84854,'Maasdijk','van','Julius','1994-04-25','2241 VZ','Wassenaar', 75.2, 1.80, 01-01-2018),
	(86066,'Wijk','van','Nicky','1994-05-27','2411 AK','Bodegraven',  78.3, 1.86, 01-01-2018),
	(89429,'Wils','','Bob','1991-04-30','2231 ZX','Rijnsburg', 70.9, 1.90, 01-01-2018),
	(84565,'Yan','','Davy','1993-03-05','2408 JV','Alphen a/d Rijn', 71.1, 1.84, 01-01-2018),
	(87989,'Zwam','van der','Rick','1991-07-10','2201 SW','Noordwijk', 74.4, 1.87, 01-01-2018);
    
INSERT INTO klassen_studenten(ov_nummer, klas_code) VALUES
	(86476,'lo8e-amo1'),
	(87956,'lo8e-amo3'),
	(77425,'lo8e-amo1'),
	(85204,'lo8e-amo2'),
	(86043,'lo8e-amo1'),
	(77245,'lo8e-amo2'),
	(79899,'lo8e-amo4'),
	(83091,'lo8e-amo3'),
	(85526,'lo8e-amo1'),
	(79553,'lo8e-amo2'),
	(78854,'lo8e-amo3'),
	(78979,'lo8e-amo1'),
	(88724,'lo8e-amo4'),
	(87165,'lo8e-amo3'),
	(86046,'lo7e-amo1'),
	(79837,'lo8e-amo2'),
	(85957,'lo8e-amo3'),
	(84907,'lo7e-amo1'),
	(83680,'lo8e-amo2'),
	(77717,'lo8e-amo3'),
	(88856,'lo8e-amo1'),
	(84729,'lo8e-amo2'),
	(85183,'lo8e-amo3'),
	(86521,'lo8e-amo1'),
	(89429,'lo8e-amo4'),
	(84565,'lo8e-amo2');
    
INSERT INTO vakken (vak_code, titel) VALUES
	('PHP', 'PHP Hypertext Preprocessor'),
	('HTM', 'HyperText Markup Language'),
    ('NED', 'Nederlands'),
    ('ENG', 'Engels'),
    ('LOG', 'Logica'),
    ('SQL', 'Databases'),
    ('PRJ', 'Project'),
    ('STG', 'Stage');

INSERT INTO lessen (klas_code, jaargang, periode, weekdag, lesuur, docent_code, vak_code) VALUES
    ('lo7e-amo1', 1, 1, 1, 1, 'bkr02', 'PHP'), 
    ('lo7e-amo1', 1, 1, 1, 2, 'bkr02', 'PHP'), 
    ('lo7e-amo1', 1, 1, 1, 4, 'vlt03', 'PRJ'), 
    ('lo7e-amo1', 1, 1, 1, 5, 'vlt03', 'PRJ'), 
    ('lo7e-amo1', 1, 1, 1, 6, 'vlt03', 'PRJ'),
    ('lo7e-amo1', 1, 1, 2, 3, 'rs001', 'HTM'), 
    ('lo7e-amo1', 1, 1, 2, 4, 'rs001', 'HTM'), 
    ('lo7e-amo1', 1, 1, 2, 5, 'akr02', 'SQL'),
    
    ('lo7e-amo1', 2, 1, 1, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 1, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 1, 2, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 2, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 1, 3, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 3, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 1, 4, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 4, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 1, 5, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 1, 5, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 2, 1, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 1, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 2, 2, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 2, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 2, 3, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 3, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 2, 4, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 4, 8, NULL, 'STG'),
    
    ('lo7e-amo1', 2, 2, 5, 1, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 2, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 3, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 4, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 5, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 6, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 7, NULL, 'STG'), 
    ('lo7e-amo1', 2, 2, 5, 8, NULL, 'STG'),
    
    ('lo8e-amo1', 1, 1, 1, 1, 'bkr02', 'PHP'), 
    ('lo8e-amo1', 1, 1, 1, 2, 'bkr02', 'PHP'), 
    ('lo8e-amo1', 1, 1, 1, 4, 'vlt03', 'PRJ'), 
    ('lo8e-amo1', 1, 1, 1, 5, 'vlt03', 'PRJ'), 
    ('lo8e-amo1', 1, 1, 1, 6, 'vlt03', 'PRJ'),
    ('lo8e-amo1', 1, 1, 2, 3, 'rs001', 'HTM'), 
    ('lo8e-amo1', 1, 1, 2, 4, 'rs001', 'HTM'), 
    ('lo8e-amo1', 1, 1, 2, 5, 'akr02', 'SQL'),
    
    ('lo8e-amo2', 1, 1, 1, 1, 'rs001', 'HTM'), 
    ('lo8e-amo2', 1, 1, 1, 2, 'rs001', 'HTM'), 
    ('lo8e-amo2', 1, 1, 1, 3, 'akr02', 'SQL'), 
    ('lo8e-amo2', 1, 1, 3, 1, 'vlt03', 'PRJ'), 
    ('lo8e-amo2', 1, 1, 3, 2, 'vlt03', 'PRJ'), 
    ('lo8e-amo2', 1, 1, 3, 3, 'vlt03', 'PRJ'),
    ('lo8e-amo2', 1, 1, 3, 5, 'bkr02', 'PHP'), 
    ('lo8e-amo2', 1, 1, 3, 6, 'bkr02', 'PHP'),
    
    ('lo8e-amo3', 1, 1, 2, 1, 'rs001', 'HTM'), 
    ('lo8e-amo3', 1, 1, 2, 2, 'rs001', 'HTM'), 
    ('lo8e-amo3', 1, 1, 2, 4, 'vlt03', 'PRJ'), 
    ('lo8e-amo3', 1, 1, 2, 5, 'vlt03', 'PRJ'), 
    ('lo8e-amo3', 1, 1, 2, 6, 'vlt03', 'PRJ'), 
    ('lo8e-amo3', 1, 1, 3, 1, 'akr02', 'SQL'),
    ('lo8e-amo3', 1, 1, 3, 2, 'bkr02', 'PHP'), 
    ('lo8e-amo3', 1, 1, 3, 3, 'bkr02', 'PHP'),
    
    ('lo8e-amo4', 1, 1, 4, 1, 'bkr02', 'PHP'), 
    ('lo8e-amo4', 1, 1, 4, 2, 'bkr02', 'PHP'), 
    ('lo8e-amo4', 1, 1, 4, 4, 'vlt03', 'PRJ'), 
    ('lo8e-amo4', 1, 1, 4, 5, 'vlt03', 'PRJ'), 
    ('lo8e-amo4', 1, 1, 4, 6, 'vlt03', 'PRJ'), 
    ('lo8e-amo4', 1, 1, 5, 1, 'akr02', 'SQL'),
    ('lo8e-amo4', 1, 1, 5, 2, 'rs001', 'HTM'), 
    ('lo8e-amo4', 1, 1, 5, 3, 'rs001', 'HTM');    
    
INSERT INTO cijfers (ov_nummer, vak_code, jaargang, periode, poging, cijfer)
	SELECT ov_nummer, vak_code, jaargang, periode, 1 AS poging, FLOOR(RAND() * 10) AS cijfer
	FROM (
		SELECT DISTINCT studenten.ov_nummer, lessen.vak_code, lessen.jaargang, lessen.periode
		FROM klassen
		INNER JOIN klassen_studenten ON klassen_studenten.klas_code = klassen.klas_code
		INNER JOIN studenten ON klassen_studenten.ov_nummer = studenten.ov_nummer
		INNER JOIN lessen ON lessen.klas_code = klassen.klas_code
		WHERE klassen.cohort = 2017 AND lessen.jaargang = 1
    ) AS studenten_lessen;