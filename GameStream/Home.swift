//
//  Home.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 30/08/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Pantalla Home").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "star")
                Text("Favoritos")
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
