//
//  AllFriendViewController.swift
//  UI_app
//
//  Created by Вячеслав on 16.08.2021.
//

import UIKit

final class AllFriendViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var BackButton: UINavigationItem!
    
    
    let storage: FriendStorage = FriendStorage()

    var sortedFriends = [[FriendModel]]()
    var firstLetters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        navigationController!.navigationBar.tintColor = UIColor.black
       
        
        let friends = storage.allFriends
        firstLetters = firstLetters(friends)
        sortedFriends = sortedFriends(friends, firstLetters: firstLetters)
        tableView.delegate = self
        tableView.dataSource = self
        
       /*let header = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 50)))
        header.backgroundColor = .brown
        tableView.tableHeaderView = header*/
        
        
        tableView.register(AllFriendHeaderTableView.self, forHeaderFooterViewReuseIdentifier: AllFriendHeaderTableView.identofier)
    }
    
    private func sortedFriends(_ friends: [FriendModel], firstLetters: [Character]) ->[[FriendModel]] {
        var sortedFriends = [[FriendModel]] ()
        for letter in firstLetters {
            let friendForLetter = friends.filter { $0.name.first == letter }
            sortedFriends.append(friendForLetter)
        }
        return sortedFriends
    }
    
    private func firstLetters(_ friends: [FriendModel]) ->[Character] {
        let allFirstLetter = friends.compactMap { $0.name.first } // первые буквы
        let withoutDublecateLetter = Array(Set(allFirstLetter)) //дубликаты удаляем
        return withoutDublecateLetter.sorted() //сортируем и возвращаем
    }

}

extension AllFriendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sortedFriends.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedFriends[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AllFriendViewCell.identifier) as! AllFriendViewCell
        let friend = sortedFriends[indexPath.section][indexPath.row]
        cell.configure(friend: friend)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AllFriendHeaderTableView.identofier) as! AllFriendHeaderTableView
        
        header.configure(String(firstLetters[section]))
        return header
        
    }
    
    
}

