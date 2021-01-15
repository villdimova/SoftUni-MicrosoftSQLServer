CREATE VIEW v_HiighestPeak
AS
SELECT TOP(1)* FROM Peaks
ORDER BY Elevation DESC

