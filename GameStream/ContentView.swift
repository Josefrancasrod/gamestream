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
            Spacer()
            //Color(.blue).ignoresSafeArea()
            Color( red: 19/255, green: 30/255, blue: 60/255,opacity: 1.0  ).ignoresSafeArea()
            VStack{
                Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                InicioYRegistroView()
            }
            
            
        }
    }
}

struct InicioSesionView: View {
    var body: some View{
        VStack{
            Text("inicio")
        }
    }
}

struct RegistroView: View {
    var body: some View{
        VStack{
            Text("Registro")
        }
    }
}
struct InicioYRegistroView:View {
    @State var tipoInicioSesion = true
    
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true
                    print("Inicio de sesión")
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    tipoInicioSesion = false
                    print("Registrando...")
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
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
