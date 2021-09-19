//
//  EditProfileView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 16/09/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            ScrollView {
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack {
                            Image("30-swiftui-apps-ios-profile-pic").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 118, height: 118).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                        
                        
                    })
                    
                    ModuloEditar()
                }.padding(.bottom, 18.0)
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct ModuloEditar:View {
    @State var correo:String = ""
    @State var contrasenia:String = ""
    @State var username: String = ""
    var body: some View{
        
        
        VStack(alignment: .leading) {
            Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text("ejemplo@mail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                TextField("", text: $correo).foregroundColor(.white)
                
            }
            Divider().frame(height:1.0).background(Color("Dark-Cian"))
            Text("Contraseña").foregroundColor(Color(.white))
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text("Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                SecureField("", text: $contrasenia)
                
            }
            Divider().frame(height:1.0).background(Color("Dark-Cian")).foregroundColor(.white)
            Text("Nombre de Usuario").foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if correo.isEmpty{
                    Text("Introduce tu usuario").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                TextField("", text: $username).foregroundColor(.white)
                
            }
            Divider().frame(height:1.0).background(Color("Dark-Cian"))
            
            Button(action: {actualizarDatos()}, label: {
                Text("ACTUALIZAR DATOS").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 3.0).shadow(color: .white, radius: 6))
            }).padding(.bottom)
        }.padding(.horizontal, 42.0)
        
        
    }
    
    func actualizarDatos() {
        print("se actualizaron los datos")
    }
}
