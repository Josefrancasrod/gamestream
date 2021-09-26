//
//  OffestPosition.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 24/09/21.
//

import SwiftUI

struct OffestPosition: View {
    var body: some View {
        GeometryReader(content: { geometry in
            VStack{
                Image("platzi").resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width/2, height: geometry.size.height/3)
                //Offsets()
                //Positions()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct OffestPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffestPosition()
    }
}

struct Offsets:View{
    var body: some View{
        Image("platzi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .offset(x: 18.0, y: 20.0)
        
        Text("Platzi").foregroundColor(.blue).bold()
    }
}

struct Positions:View{
    var body: some View{
        VStack{
            Image("platzi").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .position(x: 100, y: 32)
        }
    }
}

