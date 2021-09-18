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
    var body: some View{
        Text("Modulo Editar")
    }
}
