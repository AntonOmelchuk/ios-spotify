//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
