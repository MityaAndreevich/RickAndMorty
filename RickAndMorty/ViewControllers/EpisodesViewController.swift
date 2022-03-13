//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Dmitry Logachev on 09.03.2022.
//

import UIKit

class EpisodesViewController: UITableViewController {
    var character: Character!
    var episodes: [Episode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = UIColor(
            red: 21/255,
            green: 32/255,
            blue: 66/255,
            alpha: 1
        )
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 32/255,
            blue: 66/255,
            alpha: 0.7
        )
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.barTintColor = .white
    }
    
    //MARK: - Table View data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.episode.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episode", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let episodeURL = character.episode[indexPath.row]
        content.textProperties.color = .white
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
