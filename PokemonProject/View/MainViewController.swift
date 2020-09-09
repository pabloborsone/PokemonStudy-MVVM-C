//
//  ViewController.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 24/08/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let pokemonViewModel = PokemonViewModel()
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBAction func didClickOnSearchButton(_ sender: UIButton) {
        guard let pokemonName = searchBar.text else { return }
        pokemonViewModel.fetch(forPokemon: pokemonName, completionFailure: presentAlert, completionSuccess: completionSuccess)
    }
    
    private func completionSuccess() {
        guard let detailViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PokemonDetailViewController") as? PokemonDetailViewController else { return }
        detailViewController.pokemonViewModel = pokemonViewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

