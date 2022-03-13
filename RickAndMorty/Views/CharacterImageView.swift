//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 13.03.2022.
//

import UIKit

class CharacterImageView: UIImageView {
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "picture")
            return
        }
    }

    

}
