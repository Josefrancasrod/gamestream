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
    @State var textoBusqueda = ""
    var body: some View{
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                
                HStack{
                    Button(action: busqueda, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? .yellow : Color("Dark-Cian"))
                    })
                    
                    ZStack(alignment: .leading){
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                    }
                }.padding([.top, .leading, .bottom], 11).background(Color("Blue-Grey")).clipShape(Capsule())
            }.padding(.horizontal, 10)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    func busqueda() {
        print("El usuario esta busacando \(textoBusqueda)")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
