SELECT 
    COUNT (DISTINCT Verkauf.ID) as COUNTKunden
FROM Verkauf 
WHERE Verkauf.Datum BETWEEN "01-01-2020" AND "31.01.2020"
GROUP BY Kunden.ID

GAMMA; COUNT(Verkauf.ID)->CountKunden (sigma Verkauf.Datum >= "01-01-2020" && Verkauf.Datum <= "31.01.2020" (Verkauf))
