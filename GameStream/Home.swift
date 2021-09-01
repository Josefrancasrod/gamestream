//
//  Home.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 30/08/21.
//

import SwiftUI

struct Home: View {
    @State var tabSeleccionado: Int = 2
    var body: some View {
        TabView (selection: $tabSeleccionado){
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            
           PantallaHome().tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag(2)
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "star")
                Text("Favoritos")
            }.tag(3)
        }.accentColor(.white)
    }
    
    init(){
        UITabBar.appearance().barTintColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
    }
}

struct PantallaHome: View{
    var body: some View{
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                
            }.padding(.horizontal, 10)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
