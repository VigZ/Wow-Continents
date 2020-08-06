//
//  Continent.swift
//  Wow Continents
//
//  Created by Kyle on 8/6/20.
//  Copyright © 2020 Kyle. All rights reserved.
//

import Foundation


struct Continent: Codable {
    var name: String
    var capitalCities: [String: [String]]
    var dungeons: [String]
    var battlegrounds: [String]
    var arenas: [String]
}
