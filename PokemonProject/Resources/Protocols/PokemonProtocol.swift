//
//  PokemonProtocol.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 08/09/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import Foundation

protocol PokemonStatsProtocol {
    var abilities: [Abilities]? { get set }
    var baseExperience: Int? { get set }
    var id: Int? { get set }
    var name: String? { get set }
    var weight: Int? { get set }
}
