//
//  NewsViewController.swift
//  UI_app
//
//  Created by Вячеслав on 04.09.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let storage: NewsStorage = NewsStorage()
    var news: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = storage.news
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as! NewsViewCell
        
        let new = news[indexPath.item]
        cell.configure(new)
        cell.likeTapped = { [weak self] islike in
            self?.news[indexPath.item].isLike = islike
        }
        return cell
    }
    
    
}


