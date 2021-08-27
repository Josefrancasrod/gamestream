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
    @State var correo = ""
    @State var password = ""
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading){
                Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $correo)
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment: .leading){
                    
                    if password.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 3.0).shadow(color: .white, radius: 6))
                }).padding(.bottom, 50)
                
                VStack{
                Text("Inicia sesión con redes sociales").foregroundColor(.white).padding(.bottom, 10)
                HStack{
                    Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("Blue-Grey")))
                    Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("Blue-Grey")))
                    
                }
                }
                
            }.padding(.horizontal, 77.0)
            
            
        }
    }
}

func iniciarSesion(){
    print("Estoy iniciando sesión")
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
