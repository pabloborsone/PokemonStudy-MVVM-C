//
//  PokemonDetailViewController.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 08/09/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    
    var pokemonViewModel: PokemonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemonViewModel?.name
        pokemonIdLabel.text = pokemonViewModel?.id?.toString()
    }
}
