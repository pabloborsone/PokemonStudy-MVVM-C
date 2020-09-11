//
//  PokemonViewModel.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 31/08/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import Foundation

class PokemonViewModel: PokemonStatsProtocol {
    var baseExperience: Int?
    var id: Int?
    var name: String?
    var weight: Int?
    var abilities: [Abilities]?
    var sprites: Sprites?
    
    private let kApiPath = "https://pokeapi.co/api/v2/pokemon/"
    private var pokemon: Pokemon? = nil {
        didSet {
            baseExperience = pokemon?.baseExperience
            id = pokemon?.id
            name = pokemon?.name
            weight = pokemon?.weight
            abilities = pokemon?.abilities
            sprites = pokemon?.sprites
        }
    }
    
    func fetch(forPokemon pokemon: String, completionFailure: @escaping (String, String) -> (), completionSuccess: @escaping () -> ()) {
        let newPath = kApiPath + pokemon
        
        guard let url = URL(string: newPath) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.pokemon = try decoder.decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    completionSuccess()
                }
            } catch {
                completionFailure("Oopsie :/", "Something went wrong, we couldn't find Pokémon: \(pokemon)")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
