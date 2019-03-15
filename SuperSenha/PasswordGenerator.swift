//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Gabriel Carvalho Guerrero on 15/03/19.
//  Copyright © 2019 Gabriel Carvalho Guerrero. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=~`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int,
         useLetters: Bool,
         useNumbers: Bool,
         useCapitalLetters: Bool,
         useSpecialCharacters: Bool) {
        
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        self.passwords.removeAll()
        
        var universe = ""
        
        if (self.useLetters) {
            universe += self.letters
        }
        
        if (self.useNumbers) {
            universe += self.numbers
        }
        
        if (self.useSpecialCharacters) {
            universe += self.specialCharacters
        }
        
        if (self.useSpecialCharacters) {
            universe += self.letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while self.passwords.count < total {
            var password = ""
            for _ in 1...self.numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            self.passwords.append(password)
        }
        
        return self.passwords
    }
}
