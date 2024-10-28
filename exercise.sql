--1
SELECT Id_książki, Tytuł
FROM Książki
WHERE (Tytuł LIKE 'S%' AND Język_oryginału = 'polski')
OR Język_oryginału IS NULL;

--2
SELECT Książki.Tytuł, CONCAT(Autorzy.Nazwisko, ' ', Autorzy.Imię1) AS Autor
FROM Książki
JOIN Autorzy ON Książki.Id_autora = Autorzy.Id_autora
WHERE Autorzy.Data_urodzenia < '1980-01-01';

--3
SELECT Nazwisko, Imię1
FROM Autorzy
WHERE Id_autora NOT IN (SELECT Id_autora FROM Książki);

--4
SELECT g.Id_gatunku, g.Nazwa_gatunku, k.Tytuł, k.Id_autora
FROM Gatunki g
JOIN Książki_Gatunki kg ON g.Id_gatunku = kg.Id_gatunku
JOIN Książki k ON kg.Id_książki = k.Id_książki;

--5
SELECT K.Id_autora
FROM Książki K
INNER JOIN Autorzy A ON K.Id_autora = A.Id_autora
WHERE K.Tytuł LIKE 'A%'
GROUP BY K.Id_autora
HAVING COUNT(*) > 3;
