//
//  ViewController.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 24/08/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let pokemonViewModel = PokemonViewModel()
    @IBOutlet weak var searchBar: UITextField!
    
    @IBAction func didClickOnSearchButton(_ sender: UIButton) {
        if let pokemonName = searchBar.text {
            pokemonViewModel.fetch(forPokemon: pokemonName)
        } else {
          showPokemonNotFoundAlert()
        }
    }
    
    private func showPokemonNotFoundAlert() {
        UIAlertController(title: "Oops :/", message: "No Pokémon found for that entry", preferredStyle: .alert).show(self, sender: nil)
    }
}

