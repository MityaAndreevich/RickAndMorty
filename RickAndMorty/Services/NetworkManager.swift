//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 23.02.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

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
    
    func fetchEpisode(from url: String, completion: @escaping(Result<Episode, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(episode))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchCharacter(from url: String, completion: @escaping(Character) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
