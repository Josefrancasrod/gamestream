//
//  ViewModel.swift
//  GameStream
//
//  Created by José Francisco Castillo Rodríguez on 03/09/21.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do{
                if let jsonData = data{
                    print("Tamaño del Json \(jsonData)")
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                    
                     
                }
            }catch{
                print("Error:\(error)")
            }
        }.resume()
    }
}