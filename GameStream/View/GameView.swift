//
//  GameView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 06/09/21.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anioPublicacion: String
    var descripcion: String
    var tags: [String]
    var imggUrl: [String]
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                video(url: url).frame(height:300)
                ScrollView{
                    //Informacion del video
                    videoInfo(titulo: titulo, studio:studio, calificacion: calificacion, anioPublicacion: anioPublicacion, descripcion: descripcion, tags: tags).padding(.bottom)
                    Gallery(imggUrl: imggUrl)
                    Comentarios()
                }.frame(maxWidth: .infinity)
                
                
                
            }
        }

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            url: "ejemplo",titulo:"Sonic The Hedgehog",
            studio: "Sega",
            calificacion: "E+",
            anioPublicacion: "1991",
            descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imggUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
        ])
    }
}

struct video:View {
    
    var url:String
    
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo:View{
    
    var titulo: String
    var studio: String
    var calificacion: String
    var anioPublicacion: String
    var descripcion: String
    var tags: [String]

    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(titulo)").foregroundColor(.white).font(.largeTitle).padding(.leading)
            
            HStack{
                Text("\(studio)").foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
                Text("\(calificacion)").foregroundColor(.white).font(.subheadline).padding(.top, 5)
                Text("\(anioPublicacion)").foregroundColor(.white).font(.subheadline).padding(.top, 5)
            }
            
            Text("\(descripcion)").foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
            
            HStack{
                ForEach(tags, id: \.self){
                    tag in
                    Text("#\(tag)").foregroundColor(.white).font(.subheadline).padding(.top, 4).padding(.leading)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
        
       
    }
}

struct Gallery:View {
    
    var imggUrl: [String]
    let formaGrud = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("GALERÍA").foregroundColor(.white).font(.title2).padding(.leading)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrud, spacing: 8){
                    ForEach(imggUrl, id: \.self){
                        imgUrl in
                        KFImage(URL(string: imgUrl)).resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }
            }.frame(height: 180)
            
        }.frame(maxWidth:.infinity, alignment: .leading).padding(.top)
            
        
        
    }
}

struct Comentarios:View{
    var body: some View{
        VStack(alignment: .leading){
            Text("COMENTARIOS").foregroundColor(.white).font(.title2).padding(.leading)
            Comentario()
            Comentario()
            Comentario()
            Comentario()
            Comentario()
        }.padding(.top)
    }
}

struct Comentario:View {
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Grey")).frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.horizontal)
            VStack(alignment: .leading){
                HStack{
                    Image("08-swiftuiapps-2105-foto-prueba").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("John Wick").foregroundColor(.white).font(.subheadline)
                        Text("Hace 7 días").foregroundColor(.white).font(.caption)
                    }
                }.frame(height: 30, alignment: .leading).padding(.leading).padding(.bottom, 5)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget libero arcu. Sed congue eros elit, id posuere massa consectetur semper. Suspendisse potenti. Sed molestie mauris a euismod volutpat.").foregroundColor(.white).font(.subheadline).padding(.horizontal)
            }.padding(.horizontal, 10)
        }.padding(.bottom)
    }
}
