//
//  FriendsViewController.swift
//  UI_app
//
//  Created by Вячеслав on 11.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let storage: FriendStorage = FriendStorage()
    var friends: [FriendModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.tintColor = UIColor.black
        friends = storage.friends
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriend" {
            
            guard
                let destinationVC = segue.destination as? GalleryViewController,
                let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            let selectFriend = friends[indexSelectCell]
            destinationVC.title = friends[indexSelectCell].name
            destinationVC.gallery = selectFriend.Gallery
        }
    }
    
    @IBAction func addFriend(_ segue: UIStoryboardSegue) {
        guard
            let sourceController = segue.source as? AllFriendViewController,
            let indexSelectCell = sourceController.tableView.indexPathForSelectedRow
            
        else { return }
        
        let friend = sourceController.sortedFriends[indexSelectCell.section][indexSelectCell.row]
        
        if !friends.contains(where: { friend.name == $0.name }) {
            friends.append(friend)
        }
        tableView.reloadData()
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        cell.configure(friend: friends[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            friends.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
}
