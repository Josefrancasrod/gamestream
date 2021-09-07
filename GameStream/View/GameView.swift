//
//  GameView.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 06/09/21.
//

import SwiftUI

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
        Text(titulo)
    }
}

/*struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}*/
