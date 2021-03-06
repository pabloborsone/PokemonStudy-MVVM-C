//
//  Extensions.swift
//  StatusBarTest
//
//  Created by Pablo Henrique Borsone on 08/09/20.
//  Copyright © 2020 Pablo Henrique Borsone. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title: String, andMessage message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
