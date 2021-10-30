//
//  LibraryPlaylistResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 30.10.2021.
//

import Foundation

struct LibraryPlaylistResponse: Codable {
    let items: [Playlist]
}
