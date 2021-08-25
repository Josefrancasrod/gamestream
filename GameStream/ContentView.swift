//
//  ContentView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 24/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            //Color(.blue).ignoresSafeArea()
            Color( red: 19/255, green: 30/255, blue: 60/255,opacity: 1.0  ).ignoresSafeArea()
            VStack{
                Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                InicioYRegistroView()
            }
            
            
        }
    }
}

struct InicioYRegistroView:View {
    var body: some View{
        VStack{
            HStack {
                Text("INICIA SESION")
                Text("REGISTRATE")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("04_swiftui-apps-ios-pantalla1").resizable()
        ContentView()
    }
}
