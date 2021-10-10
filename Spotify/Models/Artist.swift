//
//  Artist.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
