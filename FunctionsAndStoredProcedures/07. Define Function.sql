CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX)) 
RETURNS BIT
AS
BEGIN
	DECLARE @count INT =1;

WHILE(@count<=LEN(@word))
	BEGIN
		DECLARE @letter CHAR(1)=SUBSTRING(@word,@count,1)

		IF(CHARINDEX(@letter,@setOfLetters)=0) 
			BEGIN
				RETURN 0;
			END
		SET @count+=1;
	END
	RETURN 1;
END

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'Sofia')
SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves')
SELECT dbo.ufn_IsWordComprised('bobr', 'Rob')
SELECT dbo.ufn_IsWordComprised('pppp', 'Guy')