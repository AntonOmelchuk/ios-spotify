//
//  Settings.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
