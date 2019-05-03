
# Achtergrond

De inschijvingen voor het volgende schooljaar zijn vol in gang.
Omdat de web-interface van het studenten-informatie-systeem er al een tijdje uitligt, 
is er besloten dat we de inschrijvingen rechtstreeks met SQL gaan doen.



## Voorbereiding
Installeer de database dmv het bestand lo8e-sql2_1.sql

# Opdracht
Schrijf de SQL code voor de hieronderstaande deelopdrachten in het bestand 'inschrijvingen.sql'.
Maak tenminste één commit voor elke deelopdracht.

## 1 Klassen aanmaken
Voeg 3 records toe aan de tabel klassen met de volgende eisen:
- klas_code: lo9e-amo1 t/m lo9e-amo3
- slb_code: elk een eigen slb-docent
- cohort: 2019
- opleiding_code 'amo'

## 2 Studenten aanmaken
Voeg 3 records toe aan de tabel studenten.
Verzin zelf de personalia en geef ze een ov_nummer tussen 90000 en 99999. 

## 3 Koppelen student klas
Voeg 3 records toe aan de tabel klassen_studenten. 
Zorg dat de studenten die je net hebt toegevoegd elk aan een klas toegevoegd worden. 
Ze mogen niet in de zelfde klas terecht komen.

## 4 Overzicht inschrijvingen
Toon van studenten:
- die in een klas zitten waarvan het cohort 2019 is
- het ov_nummer en de volledige naam
- van de klas de klas_code
- gesorteerd op klas_code en achternaam