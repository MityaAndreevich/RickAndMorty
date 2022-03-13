//
//  ImageManager.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 13.03.2022.
//

import Foundation

class ImageManager {
    static var shared = ImageManager()
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard url == response.url else { return }
            DispatchQueue.main.async {
                completion(data, response)
            }
        }.resume()
    }
}
