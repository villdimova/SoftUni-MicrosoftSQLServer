SELECT TOP(2)s.DepositGroup
FROM 
(SELECT DepositGroup,
		AVG(MagicWandSize) AS AvgWandSize
FROM WizzardDeposits
GROUP BY DepositGroup) AS s
ORDER BY s.AvgWandSize