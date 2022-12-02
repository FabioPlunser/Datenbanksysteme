SELECT
    inner.ArtistId,
    inner.TrackId,
        inner.AlbumId,
        pc.PlaylistId
FROM (
    SELECT
        inner.ArtistId,
        trackArtist.TrackId,
                inner.AlbumId
    FROM (
        SELECT 
                albumArtist.ArtistId,
                albumArtist.AlbumId
        FROM
                Artist
        CROSS JOIN
                Album as albumArtist
        WHERE
                 albumArtist.ArtistId = Artist.ArtistId
    ) as inner
    CROSS JOIN 
        Track as trackArtist
    WHERE 
        trackArtist.AlbumId = inner.AlbumId
) as inner
CROSS JOIN
    PlaylistContent as pc
WHERE 
    pc.TrackId = inner.TrackId