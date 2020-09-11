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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var leadingSearchBarConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingSearchBarConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        moveSearchTextField()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customizeWallpaper()
        customizeSearchButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        searchBar.text?.removeAll()
    }
    
    @IBAction func didClickOnSearchButton(_ sender: Any) {
        guard let pokemonName = searchBar.text else { return }
        pokemonViewModel.fetch(forPokemon: pokemonName, completionFailure: presentAlert, completionSuccess: completionSuccess)
        dismissKeyboard()
    }
    
    private func completionSuccess() {
        guard let detailViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PokemonDetailViewController") as? PokemonDetailViewController else { return }
        detailViewController.pokemonViewModel = pokemonViewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func customizeSearchButton() {
        searchButton.backgroundColor = .gray
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.layer.cornerRadius = 10
        searchButton.layer.borderWidth = 5
        searchButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func customizeWallpaper() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "MainWallpaper")
        backgroundImage.contentMode = .scaleAspectFill
        containerView.insertSubview(backgroundImage, at: 0)
    }
    
    private func moveSearchTextField() {
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: { [weak self] in
            guard let self = self else { return }
            self.animateSearchButton()
            self.animateSearchTextField()
        })
    }
    
    private func animateSearchTextField() {
        var searchBarLeftFrame = self.searchBar.frame
        searchBarLeftFrame.origin.x -= searchBarLeftFrame.size.width
        
        var searchBarRightFrame = self.searchBar.frame
        searchBarRightFrame.origin.x += searchBarRightFrame.size.width
        
        self.searchBar.frame = searchBarLeftFrame
        self.searchBar.frame = searchBarRightFrame
    }
    
    private func animateSearchButton() {
        var searchButtonLeftFrame = self.searchButton.frame
        searchButtonLeftFrame.origin.x += searchButtonLeftFrame.size.width
        
        var searchButtonRightFrame = self.searchButton.frame
        searchButtonRightFrame.origin.x -= searchButtonRightFrame.size.width
        
        self.searchButton.frame = searchButtonLeftFrame
        self.searchButton.frame = searchButtonRightFrame
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        didClickOnSearchButton(textField)
        return true
    }
}

