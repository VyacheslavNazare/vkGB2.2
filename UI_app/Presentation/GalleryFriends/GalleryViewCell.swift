//
//  GalleryViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 16.08.2021.
//

import UIKit

final class GalleryViewCell: UICollectionViewCell {
    
    @IBOutlet private var GalleryImageView: UIImageView!
    
    @IBOutlet private var Like: Like!
    
    
    
    // передаём состояние лайка
    var likeTapped: ((Bool) -> Void)?
    
    static let identifier: String = "GalleryViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Like.addTarget(self, action: #selector(likeChanged), for: .valueChanged)
    }
    
    func configure(_ gallery: GalleryModel) {
        GalleryImageView.image = UIImage(named: gallery.imageGalley)
        GalleryImageView.layer.cornerRadius = 10
        
        Like.configure(isLike: gallery.isLike, count: gallery.countLike)
    }
    @objc private func likeChanged() {
        likeTapped?(Like.isLike)
    }
    
}
