//
//  ProfileView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 14/09/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "José Francisco"
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
            VStack{
                Text("Perfil").font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding()
                
                VStack{
                    Image("30-swiftui-apps-ios-profile-pic").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 118, height: 118).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                Text(nombreUsuario).font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding(.bottom, 9.0)
                Text("Ajustes").font(.title2).fontWeight(.bold).foregroundColor(Color.white).padding(.leading, 9.0).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                ModuloAjustes()
            }
        }.onAppear(perform: {
            print("Revisando si tiengo datos de usuario en User defaul")
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ModuloAjustes:View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    var body: some View{
        VStack(spacing: 3.0){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Cuenta").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Grey")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            Button(action: {}, label: {
                HStack {
                    Text("Notificaciones").foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
            }).background(Color("Blue-Grey")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            Button(action: {
                isEditProfileViewActive = true
            }, label: {
                HStack {
                    Text("Editar Perfil").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Grey")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Califica Esta Aplicación").foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                }.padding()
            }).background(Color("Blue-Grey")).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditProfileViewActive,
                label: {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                })
        }
    }
}
