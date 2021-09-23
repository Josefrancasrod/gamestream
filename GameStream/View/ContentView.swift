//
//  ContentView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 24/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                //Color(.blue).ignoresSafeArea()
                Color( red: 19/255, green: 30/255, blue: 60/255,opacity: 1.0  ).ignoresSafeArea()
                VStack{
                    Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    InicioYRegistroView()
                }
                
                
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InicioSesionView: View {
    @State var correo = ""
    @State var password = ""
    @State var isHomeActive = false
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading){
                Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment: .leading){
                    
                    if password.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
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
                
                NavigationLink(
                    destination: Home(),
                    isActive: $isHomeActive,
                    label: {
                        EmptyView()
                    })
                
            }.padding(.horizontal, 77.0)
            
            
        }
    }
    func iniciarSesion(){
        print("Estoy iniciando sesión")
        isHomeActive = true
    }
}



struct RegistroView: View {
    @State var correo = ""
    @State var password = ""
    @State var confirmarPassword = ""
    var body: some View{
        ScrollView{
            VStack (alignment: .center){
                Text("Elige una foto de perfil").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                Text("Puedes cambiar o elegirla más adelante").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
                Button(action: tomarFoto, label: {
                    ZStack {
                        Image("30-swiftui-apps-ios-profile-pic").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }).padding(.bottom)
            }
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Correo electrónico *").foregroundColor(Color("Dark-Cian"))
                    ZStack(alignment: .leading){
                        
                        if correo.isEmpty{
                            Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                        }
                        TextField("", text: $correo).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(.white)
                    ZStack(alignment: .leading){
                        
                        if password.isEmpty{
                            Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $password).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    Text("Confirmar contraseña").foregroundColor(.white)
                    ZStack(alignment: .leading){
                        
                        if confirmarPassword.isEmpty{
                            Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmarPassword).foregroundColor(.white)
                    }
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 30).frame(width: 300, alignment: .trailing)
                    
                }
                Button(action: registrarse, label: {
                    Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 3.0).shadow(color: .white, radius: 6))
                }).padding(.bottom, 50)
                
                VStack{
                    Text("Registrate con redes sociales").foregroundColor(.white).padding(.bottom, 10)
                    HStack{
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("Blue-Grey")))
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color("Blue-Grey")))
                        
                    }
                }
                
            }.padding(.horizontal, 77.0)
        }
        VStack{
            
        }
    }
}

func tomarFoto(){
    print("Voy a tomar foto")
}

func registrarse() {
    print("Te registraste")
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
        Image("04_swiftui-apps-ios-pantalla2").resizable()
        ContentView()
    }
}
