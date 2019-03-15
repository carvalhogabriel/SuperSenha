//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Gabriel Carvalho Guerrero on 15/03/19.
//  Copyright © 2019 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    // MARK: - @IBOutlet's
    @IBOutlet weak var textViewPasswords: UITextView!
    
    // MARK: - Var's
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Total de senhas? \(self.numberOfPasswords)"
        self.passwordGenerator = PasswordGenerator(numberOfCharacters: self.numberOfCharacters,
                                                   useLetters: self.useLetters,
                                                   useNumbers: self.useNumbers,
                                                   useCapitalLetters: self.useCapitalLetters,
                                                   useSpecialCharacters: self.useSpecialCharacters)
        
        self.generatePasswords()
    }
    
    private func generatePasswords() {
        self.textViewPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        self.textViewPasswords.text = ""
        let passwords = self.passwordGenerator.generate(total: self.numberOfPasswords)
        for password in passwords {
            self.textViewPasswords.text.append(password + "\n\n")
        }
    }
    
    // MARK: - @IBAction's
    @IBAction func generate(_ sender: UIButton) {
        self.generatePasswords()
    }
    
}
