//
//  Animaux.swift
//  myPet
//
//  Created by Justyna Warzecha on 05/03/2024.
//

import Foundation


class Animaux {
    var animaux: [Animal]
    
    init(animaux: [Animal]) {
        self.animaux = []
    }
    func tableauAnimaux(animal: Animal){
        self.animaux.append(animal)
    }
}


