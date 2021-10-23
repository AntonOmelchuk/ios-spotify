//
//  PlaylistDetailsResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 12.10.2021.
//

import Foundation

struct PlaylistDetailsRespone: Codable {
    let descriptions: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: PlaylistTracksResponse
}

struct PlaylistTracksResponse: Codable {
    let items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let track: AudioTrack
}
