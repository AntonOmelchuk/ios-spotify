//
//  SearchResult.swift
//  Spotify
//
//  Created by Anton Omelchuk on 24.10.2021.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
