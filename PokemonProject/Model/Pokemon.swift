//
//  Pokemon.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 27/08/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import Foundation

internal struct Pokemon: Codable {
    var abilities: [Abilities]
    var baseExperience: Int
    var id: Int
    var name: String
    var weight: Int
}

internal struct Abilities: Codable {
    var ability: Ability
    var isHidden: Bool
    var slot: Int
}

internal struct Ability: Codable {
    var name: String
    var url: String
}

