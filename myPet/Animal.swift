//
//  Animal.swift
//  myPet
//
//  Created by Justyna Warzecha on 05/03/2024.
//

import Foundation

class Animal: ObservableObject, Identifiable{
    var espece: String
    var image: String
    @Published var favori: Bool = false
    
    init(espece: String, image: String) {
        self.espece = espece
        self.image = image
    }
    
    func addFavoris(){
        if(favori == false){
            favori = true
            print("ajouté \(self.favori)")
        }else if favori == true{
            favori = false
            print("enlevé")
        }
    }
    func addNewAnimal(Nespece: String, Nimage: String) -> Animal {
        var nouvelAnimal = Animal(espece: Nespece, image: Nimage)
        return nouvelAnimal
        
    }
        
}
var cerf2 = Animal(espece: "Cerf", image: "Cerf")




