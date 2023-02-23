-- FUNCTION FOR MOVIE THEATER

CREATE OR REPLACE FUNCTION adjustPrice(
	ticketId INTEGER,
	newPrice FLOAT
)
RETURNS integer 
LANGUAGE plpgsql AS $$
BEGIN
	UPDATE tickets
	SET ticket_price = newPrice
	WHERE tickets_id = ticketId;
	RETURN ticketId;
END;
$$

SELECT adjustPrice(1, 15.00);

SELECT *
FROM tickets
WHERE tickets_id = (SELECT adjustPrice(1, 15.00));