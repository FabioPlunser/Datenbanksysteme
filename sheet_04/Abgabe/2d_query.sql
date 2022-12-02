SELECT
    Artist.ArtistId,
        Album.AlbumId,
    Track.TrackId,
    PlaylistContent.PlaylistId
FROM 
    Artist
JOIN
    Album
ON
    Album.ArtistId = Artist.ArtistId
JOIN 
    Track
ON 
    Track.AlbumId = Album.AlbumId
JOIN
    PlaylistContent
ON 
    PlaylistContent.TrackId = Track.TrackId