//
//  AnimalDetailView.swift
//  myPet
//
//  Created by Justyna Warzecha on 05/03/2024.
//

import SwiftUI

struct AnimalDetailView: View {
    @ObservedObject var animal: Animal
    var body: some View {
        AnimalDetail(animal: animal)
    }
}

struct AnimalDetail: View {
    @ObservedObject var animal: Animal
    var body: some View {
        VStack {
            ZStack{
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 100, height: 90)
                    .cornerRadius(15)
                
                Image(animal.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .padding(.bottom,14)
            }
            
            HStack{
                Text(animal.espece)
                Button(action: { animal.addFavoris()}, label: {
                    Image(systemName: animal.favori ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                    //.foregroundStyle(.yellow)
                })
                
            }
            .padding(.top, -15)
        }
    }
}
