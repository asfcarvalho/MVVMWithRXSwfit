//
//  Person.swift
//  ViperWithRXSwift
//
//  Created by asfcarvalho on 09/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import Foundation

struct Person: Codable {
    let name, height, mass, hairColor: String?
    let skinColor, eyeColor, birthYear: String?
    let gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?
    var isFavorite: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url, isFavorite
    }
}
