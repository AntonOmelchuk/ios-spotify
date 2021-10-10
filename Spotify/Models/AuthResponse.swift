//
//  AuthResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    var expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
