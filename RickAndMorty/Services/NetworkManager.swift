//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 23.02.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(RickAndMorty) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(rickAndMorty)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
