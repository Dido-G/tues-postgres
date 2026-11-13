docker exec local-postgres pg_dump -U postgres -d playlists -f /tmp/dump.sql
docker cp local-postgres:/tmp/dump.sql dump.sql
