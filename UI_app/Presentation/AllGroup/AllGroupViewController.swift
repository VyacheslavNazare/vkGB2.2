//
//  AllGroupViewController.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import UIKit

final class AllGroupViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let storage: GroupStorage = GroupStorage()
    
    var sortedGroups = [[GroupModel]]()
    var firstLetters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.tintColor = UIColor.black
        
        let groups = storage.allGroup
        firstLetters = firstLetters(groups)
        sortedGroups = sortedGroups(groups, firstLetters: firstLetters)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AllGroupHeaderTableView.self, forHeaderFooterViewReuseIdentifier: AllGroupHeaderTableView.identofier)
    }
    
    private func sortedGroups(_ groups: [GroupModel], firstLetters: [Character]) ->[[GroupModel]] {
        var sortedGroups = [[GroupModel]] ()
        for letter in firstLetters {
            let groupsForLetter = groups.filter { $0.nameG.first == letter }
            sortedGroups.append(groupsForLetter)
        }
        return sortedGroups
    }
    
    private func firstLetters(_ groups: [GroupModel]) ->[Character] {
        let allFirstLetter = groups.compactMap { $0.nameG.first } // первые буквы
        let withoutDublecateLetter = Array(Set(allFirstLetter)) //дубликаты удаляем
        return withoutDublecateLetter.sorted() //сортируем и возвращаем
    }
    
   
}

extension AllGroupViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        sortedGroups.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedGroups[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupViewCell.identifier) as! AllGroupViewCell
        let groups = sortedGroups[indexPath.section][indexPath.row]
        cell.configure(group: groups)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AllGroupHeaderTableView.identofier) as! AllGroupHeaderTableView
        
        header.configure(String(firstLetters[section]))
        return header
        
    }
    
}
