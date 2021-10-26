//
//  SearchResultResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 24.10.2021.
//

import Foundation

struct SearchResultResponse: Codable {
    let albums: SearchAlbumRespnose
    let artists: SearchArtistsResponse
    let playlists: SearchPlaylistResponse
    let tracks: SearchTracksResponse
}

struct SearchAlbumRespnose: Codable {
    let items: [Album]
}

struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

struct SearchPlaylistResponse: Codable {
    let items: [Playlist]
}

struct SearchTracksResponse: Codable {
    let items: [AudioTrack]
}
