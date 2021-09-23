//
//  NewsViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 04.09.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {

    static let identifier = "NewsViewCell"
    var likeTapped: ((Bool) -> Void)?
    
    @IBOutlet private var NewsImageCell: UIImageView!
    @IBOutlet private var NewsLabelCell: UILabel!
    @IBOutlet private var Like: Like!
    
    func configure(_ news: NewsModel) {
        NewsImageCell.image = UIImage(named: news.imageNews)
        NewsLabelCell.text = news.textNews
        Like.configure(isLike: news.isLike, count: news.countLike)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Like.addTarget(self, action: #selector(likeChanged), for: .valueChanged)
    }
    
    @objc private func likeChanged() {
        likeTapped?(Like.isLike)
    }
    
}
