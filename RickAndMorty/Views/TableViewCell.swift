//
//  TableViewCell.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 12.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: CharacterImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    //MARK: - Public Methods
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        characterImageView.fetchImage(from: character?.image ?? "")
    }
}
