//
//  ListePets.swift
//  myPet
//
//  Created by Justyna Warzecha on 05/03/2024.
//

import SwiftUI

struct ListePets: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                
                ListeAnimaux()
            }
        }
        
    }
}

#Preview {
    ListePets()
}

struct ListeAnimaux: View {
    @State private var searchText = ""
    @State private var showingPopover = false
    @State private var espace = ""
    @State private var image = ""
    @ObservedObject var cerf = Animal(espece: "Cerf", image: "Cerf")
    @ObservedObject var chat = Animal(espece: "Chat", image: "Chat")
    @ObservedObject var chien = Animal(espece: "Chien", image: "Chien")
    @ObservedObject var grenouille = Animal(espece: "Grenouille", image: "Grenouille")
    @ObservedObject var lapin = Animal(espece: "Lapin", image: "Lapin")
    @ObservedObject var lion = Animal(espece: "Lion", image: "Lion")
    @ObservedObject var panda = Animal(espece: "Panda", image: "Panda")
    @ObservedObject var singe = Animal(espece: "Singe", image: "Singe")
    @ObservedObject var vache = Animal(espece: "Vache", image: "Vache")
    //@ObservedObject var test: Animal
     var animaux: [Animal] { [cerf, chat, chien, grenouille, lapin, lion, panda, singe, vache] }
    var searchResults: [Animal] {
        if searchText.isEmpty{
            return animaux
        } else {
            searchText = searchText
            return animaux.filter { $0.espece.contains(searchText) }
        }
    }
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(searchResults){animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
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
                                .foregroundStyle(.black)
                            Button(action: { animal.addFavoris()}, label: {
                                Image(systemName: animal.favori ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                //.foregroundStyle(.yellow)
                            })
                            
                        }
                        .padding(.top, -15)
                    }
                }
                .searchable(text: $searchText)
                
            }
            Button(action: {showingPopover = true
                
            }, label: {
                ZStack{
                    Circle()
                        .fill(.yellow)
                        .frame(width: 50)
                    Text("+")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
            })
            .popover(isPresented: $showingPopover) {
                VStack{
                    TextField("Enter your name", text: $espace)
                    TextField("Enter your name", text: $image)
//                    Button(action: {
//                        let nouvelAnimal = Animal(espece: espace, image: image)
//                        animaux.append(nouvelAnimal)
//                    }, label: {
//                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                    })
                }
                .padding()
            }
          
            
        }
    }
  
}
