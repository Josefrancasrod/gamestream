//
//  GamesView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 03/09/21.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    var body: some View {
        Text("Hola desde pantalla GamesView").navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(
            perform: {
                print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                print("Titulo del videojuego del json \(todosLosVideojuegos.gamesInfo[0].title)")
            }
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
