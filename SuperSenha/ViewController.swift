//
//  ViewController.swift
//  SuperSenha
//
//  Created by Gabriel Carvalho Guerrero on 15/03/19.
//  Copyright © 2019 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet's
    @IBOutlet weak var textFieldTotalPasswords: UITextField!
    @IBOutlet weak var textFieldNumberOfCharacters: UITextField!
    @IBOutlet weak var switchLetters: UISwitch!
    @IBOutlet weak var switchNumbers: UISwitch!
    @IBOutlet weak var switchCapitalLetters: UISwitch!
    @IBOutlet weak var switchSpecialCharacters: UISwitch!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(self.textFieldTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(self.textFieldNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = self.switchLetters.isOn
        passwordsViewController.useNumbers = self.switchNumbers.isOn
        passwordsViewController.useCapitalLetters = self.switchCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = self.switchSpecialCharacters.isOn
        
        view.endEditing(true)
    }

}

