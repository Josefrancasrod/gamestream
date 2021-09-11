//
//  Home.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 30/08/21.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var tabSeleccionado: Int = 2
    var body: some View {
        TabView (selection: $tabSeleccionado){
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            
            GamesView().font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
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
    
    var body: some View{
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            ScrollView{
            VStack{
                Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                
                
                SubModuloHome()
            }.padding(.horizontal, 10)
                
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
   /* func busqueda() {
        print("El usuario esta busacando \(textoBusqueda)")
    }*/
}

struct SubModuloHome: View{
    @State var isGameInfoEmpty = false
    @State var textoBusqueda = ""
    
    @ObservedObject var  juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    //@State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    //@State var isPlayerActive = false
    //let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion = ""
    @State var anioPublicacion = ""
    @State var descripcion = ""
    @State var tags: [String] = [""]
    @State var imggUrl: [String] = [""]
    
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    watchGame(name: textoBusqueda)
                }, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? .yellow : Color("Dark-Cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                }
                
                
                
                ZStack(alignment: .leading){
                    if textoBusqueda.isEmpty {
                        Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                }
                
            }.padding([.top, .leading, .bottom], 11).background(Color("Blue-Grey")).clipShape(Capsule())
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).bold().frame( minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ZStack{
                Button(action: {watchGame(name: "The Witcher")}, label: {
                    VStack(spacing: 0){
                        Image("13-swiftuiapps-2105-thewitcher").resizable().scaledToFill()
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color("Blue-Grey"))
                    }
                })
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42)
            }.frame( minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            Text("CATEGORIAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).bold().frame( minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        print("RPG")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Grey")).frame(width: 160, height: 90)
                            Image("rpg-icon").resizable().scaledToFit().frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {
                        print("Shooter")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Grey")).frame(width: 160, height: 90)
                            Image("Vector-shot").resizable().scaledToFit().frame(width: 42, height: 42)
                        }
                    })
                    
                    Button(action: {
                        print("OPEN WORLD")
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Grey")).frame(width: 160, height: 90)
                            Image("open-world-icon").resizable().scaledToFit().frame(width: 42, height: 42)
                        }
                    })
                }
            }
            
            Text("RECOMENDADOS PARA TI").font(.title3).foregroundColor(.white).bold().frame( minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {watchGame(name: "Crash")}, label: {
                        Image("13-swiftuiapps-2105-assassins_creed").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {watchGame(name: "Cuphead")}, label: {
                        Image("13-swiftuiapps-2105-spiderman").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {watchGame(name: "Grand Theft")}, label: {
                        Image("13-swiftuiapps-2105-lastofus").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                }
            }
            
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame( minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {watchGame(name: "Abzu")}, label: {
                        Image("13-swiftuiapps-2105-battkefield").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {watchGame(name: "Halo")}, label: {
                        Image("13-swiftuiapps-2105-farcry4").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {watchGame(name: "Death")}, label: {
                        Image("13-swiftuiapps-2105-titanfall2").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                }
            }
        }
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anioPublicacion: anioPublicacion, descripcion: descripcion, tags: tags, imggUrl: imggUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
        
    }
    
    func watchGame(name:String){
        juegoEncontrado.search(gameName: name)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.3){
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0{
                isGameInfoEmpty = true
            }else{
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anioPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imggUrl = juegoEncontrado.gameInfo[0].galleryImages
                isGameViewActive = true
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
