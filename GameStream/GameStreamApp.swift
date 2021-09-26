//
//  GameStreamApp.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 24/08/21.
//

import SwiftUI


@main
struct GameStreamApp: App {
    //init() {
        
    //}
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //ContentView()
        }.onChange(of: scenePhase){ phase in
            print(phase)
            
            
            if phase == .active{
                
            }
            if phase == .background {
                
            }
            if phase == .inactive {
                
            }
            
        }
    }
}
