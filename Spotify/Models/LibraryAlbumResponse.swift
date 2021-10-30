//
//  LibraryAlbumResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 30.10.2021.
//

import Foundation

struct LibraryAlbumResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
