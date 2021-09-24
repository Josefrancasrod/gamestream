//
//  Assets2x3x.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 23/09/21.
//

import SwiftUI

struct Assets2x3x: View {
    var body: some View {
        Image("platzi")
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        Assets2x3x()
        Assets2x3x()
            .previewDevice("iPad Pro (9.7-inch)")
        Assets2x3x()
            .previewDevice("iPhone 8")
    }
}
