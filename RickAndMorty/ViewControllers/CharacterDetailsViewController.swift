//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 09.03.2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImageView: CharacterImageView!
    
    var character: Character!
    
    private var spinnerView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        title = character.name
        descriptionLabel.text = character.description
        characterImageView.fetchImage(from: character.image)
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let episodesVC = navigationController.topViewController as! EpisodesViewController
        episodesVC.character = character
    }

}
