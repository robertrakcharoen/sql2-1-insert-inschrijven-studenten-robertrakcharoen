
# Achtergrond

De inschijvingen voor het volgende schooljaar zijn vol in gang.
Omdat de web-interface van het studenten-informatie-systeem er al een tijdje uitligt, 
is er besloten dat we de inschrijvingen rechtstreeks met SQL gaan doen.

# Voorbereiding
Installeer de database dmv het bestand lo8e-sql2_1.sql

# Inleveren
Zorg dat alle commits gemerged zijn naar de develop-branch en push deze naar github.

# Opdracht
Schrijf de SQL code voor de hieronderstaande deelopdrachten in het bestand 'inschrijvingen.sql'.
*Maak tenminste één commit voor elke deelopdracht.*

## 1 Klassen aanmaken
Voeg 3 records toe aan de tabel klassen met de volgende eisen:
- klas_code: lo9e-amo1 t/m lo9e-amo3
- slb_code: elk een eigen slb-docent
- cohort: 2019
- opleiding_code 'amo'

*Vergeet niet te committen!*

## 2 Studenten aanmaken
Voeg 4 records toe aan de tabel studenten.
- ov_nummer: tussen 90000 en 99999. 
- Verzin zelf de rest van de velden

*Vergeet niet te committen!*

## 3 Koppelen student klas
Voeg 4 records toe aan de tabel klassen_studenten. 
- Zorg dat de studenten die je net hebt toegevoegd elk aan een klas toegevoegd worden. 
- Alle klassen moeten tenminste 1 student bevatten.

*Vergeet niet te committen!*

## 4 Wijzigen student
Een van de net ingeschreven studenten heeft zijn/haar geboortedatum verkeerd opgegeven. 
Wijzig dit d.m.v. een UPDATE statement.

*Vergeet niet te committen!*

## 5 Oude studenten inactief
Studenten ingeschreven voor 1-1-2017 dienen inactief gezet te worden.
Wijzig dit d.m.v een UPDATE statement. 

*Vergeet niet te committen!*

## 6 Overzicht inschrijvingen
Toon van alle studenten die actief zijn:
- het ov_nummer, de volledige naam
- van hun klassen: de klas_code en cohort
- van hun slb-er: de volledige naam
- gesorteerd op klas_code en achternaam

*Vergeet niet te committen!*
