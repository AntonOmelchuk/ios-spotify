//
//  CategoriesResponse.swift
//  Spotify
//
//  Created by Anton Omelchuk on 23.10.2021.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
