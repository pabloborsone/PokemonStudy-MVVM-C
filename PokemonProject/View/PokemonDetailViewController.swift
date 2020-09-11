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
    @IBOutlet weak var pokemonBaseExperienceLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemonViewModel: PokemonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemonViewModel?.name?.capitalized
        pokemonIdLabel.text = pokemonViewModel?.id?.toString()
        pokemonBaseExperienceLabel.text = pokemonViewModel?.baseExperience?.toString()
        pokemonImageView.image = try? UIImage(data: Data(contentsOf: URL(string: (pokemonViewModel?.sprites?.frontDefault)!)!))
    }
}
