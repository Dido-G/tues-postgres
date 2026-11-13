-- Query 1: Returns all songs in a specific playlist ('Gym & Workout'), ordered by their track position.
-- Columns returned: position, title, artist, duration.
SELECT 
    ps.position,
    s.title,
    s.artist,
    s.duration
FROM playlist_songs ps
JOIN playlists p ON ps.playlist_id = p.id
JOIN songs s ON ps.song_id = s.id
WHERE p.name = 'Gym & Workout'
ORDER BY ps.position ASC;

-- Query 2: Returns every playlist along with its total number of songs and total combined duration.
-- Columns returned: playlist_name, song_count, total_duration.
SELECT 
    p.name AS playlist_name,
    COUNT(ps.song_id) AS song_count,
    COALESCE(SUM(s.duration), INTERVAL '0 seconds') AS total_duration
FROM playlists p
LEFT JOIN playlist_songs ps ON p.id = ps.playlist_id
LEFT JOIN songs s ON ps.song_id = s.id
GROUP BY p.id, p.name
ORDER BY p.id;
