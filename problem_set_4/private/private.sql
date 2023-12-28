-- Create a permanent table for the triplets
CREATE TABLE triplets (
    sentence_id INT,
    start_char INT,
    length INT
);

-- Insert the given triplets into the triplets table
INSERT INTO triplets (sentence_id, start_char, length) VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

-- Create the view 'message' to decode the cipher
CREATE VIEW message AS
SELECT substr(sentence, start_char, length) AS phrase
FROM sentences
JOIN triplets ON sentences.id = triplets.sentence_id;

-- The following query can be used to retrieve the decoded message
-- SELECT "phrase" FROM "message";

