SELECT 
        inner.ArtistId,
    inner.AlbumId,
    inner.TrackId,
    inner.PlaylistId
FROM
    (
        SELECT 
                        Artist.ArtistId,
                        album.ArtistId as AlbumArtistId,
            album.AlbumId,
            track.TrackId,
                        track.AlbumId as AlbumTrackId,
            pc.PlaylistId,
                        pc.TrackId as PcTrackId
        FROM
            Artist
        CROSS JOIN
            Album as album
        CROSS JOIN 
            Track as track
        CROSS JOIN 
            PlaylistContent as pc
    ) as inner
WHERE 
        inner.AlbumArtistId = inner.ArtistId AND
    inner.PcTrackId = inner.TrackId AND
    inner.AlbumId = inner.AlbumTrackId