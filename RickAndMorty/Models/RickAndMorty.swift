//
//  RickAndMorty.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 23.02.2022.
//

import Foundation

struct RickAndMorty {
    let info: Info
    let results: [Character]
}

struct Info {
    let pages: Int
    let next: String?
    let previous: String?
}

struct Character {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Species: \(species)
    Gender: \(gender)
    Origin: \(origin.name ?? "")
    Location: \(location.name ?? "")
    """
    }
}

struct Location {
    let name: String?
    let url: String?
}

struct Episode: Decodable {
    let name: String
    let date: String
    let episode: String
    let characters: [String]
    
    var description: String {
        """
    Title: \(name)
    Date: \(date)
    """
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "air_date"
        case episode = "episode"
        case characters = "characters"
    }
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}
