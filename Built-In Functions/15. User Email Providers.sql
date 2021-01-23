SELECT Username,
		RIGHT(Email,LEN(Email)-CHARINDEX(N'@', Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider],Username



