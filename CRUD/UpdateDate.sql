UPDATE Projects
	SET EndDate =GETDATE()
	WHERE EndDate =1


SELECT * FROM Projects
	