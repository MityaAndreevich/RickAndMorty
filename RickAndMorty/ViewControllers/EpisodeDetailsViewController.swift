//
//  EpisodeDetailsViewController.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 09.03.2022.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var episodeSescriptionLabel: UILabel!
    
    var episode: Episode!
    private var characters: [Character] = [] {
        didSet {
            if characters.count == episode.characters.count {
                characters = characters.sorted { $0.id < $1.id }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCharacters()
        tableView.backgroundColor = UIColor(
            red: 21/255,
            green: 32/255,
            blue: 66/255,
            alpha: 1
        )
        title = episode.episode
        episodeSescriptionLabel.text = episode.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! CharacterDetailsViewController
        detailsVC.character = sender as? Character
    }
    
    private func setCharacters() {
        episode.characters.forEach { characterURL in
            NetworkManager.shared.fetchCharacter(from: characterURL) { character in
                self.characters.append(character)
            }
        }
    }
}

//MARK: - TableView Data Source
extension EpisodeDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episode.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let charactersURL = episode.characters[indexPath.row]
        NetworkManager.shared.fetchCharacter(from: charactersURL) { character in
            cell.configure(with: character)
        }
        return cell
    }
}

//MARK: - TableView Delegate
extension EpisodeDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        performSegue(withIdentifier: "showCharacter", sender: character)
    }
}
