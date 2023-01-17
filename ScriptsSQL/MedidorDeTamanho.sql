SET @initial_size = (SELECT SUM(data_length + index_length) FROM information_schema.tables WHERE table_schema = 'CaumPetClinic');

-- Wait for 1 hour

SET @final_size = (SELECT SUM(data_length + index_length) FROM information_schema.tables WHERE table_schema = 'CaumPetClinic');

SET @growth = @final_size - @initial_size;

SELECT @initial_size AS 'Initial Size', @final_size AS 'Final Size', @growth AS 'Growth'