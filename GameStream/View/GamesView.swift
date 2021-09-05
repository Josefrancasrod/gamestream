//
//  GamesView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 03/09/21.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion = ""
    @State var anioPublicacion = ""
    @State var descripcion = ""
    @State var tags: [String] = [""]
    @State var imggUrl: [String] = [""]
    
    let formaGrid =  [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Text("Juegos").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                            juego in
                            
                            Button(action: {
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anioPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imggUrl = juego.galleryImages
                                
                                print("Pulse el juego \(titulo)")
                                
                            }, label: {
                                KFImage(URL(string: juego.galleryImages[0])!).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 4)).padding(.bottom, 12)
                            })
                        }
                    }
                }
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(
            perform: {
                //print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                //print("Titulo del videojuego del json \(todosLosVideojuegos.gamesInfo[0].title)")
            }
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
