//
//  Pokemon.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 27/08/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let abilities: [Abilities]
    let baseExperience: Int
    let id: Int
    let name: String
    let weight: Int
    let sprites: Sprites?
}

struct Abilities: Decodable {
    let ability: Ability
    let isHidden: Bool
    let slot: Int
}

struct Ability: Decodable {
    let name: String
    let url: String
}

struct Sprites: Decodable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}


