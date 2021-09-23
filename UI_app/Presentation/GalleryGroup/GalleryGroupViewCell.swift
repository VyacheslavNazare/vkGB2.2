//
//  GalleryGroupViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import UIKit

final class GalleryGroupViewCell: UICollectionViewCell {
    @IBOutlet private var Like: Like!
    var likeTapped: ((Bool) -> Void)?
    static let identifier: String = "GalleryGroupViewCell"

    @IBOutlet private var ImageGalleryGroup: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Like.addTarget(self, action: #selector(likeChanged), for: .valueChanged)
    }
    
    func configure(_ galleryGroup: GalleryGroupModel) {
        
        ImageGalleryGroup.image = UIImage(named: galleryGroup.imageGalleryGroup)
        ImageGalleryGroup.layer.cornerRadius = 10
        Like.configure(isLike: galleryGroup.isLike, count: galleryGroup.countLike)
        
    }
    @objc private func likeChanged() {
        likeTapped?(Like.isLike)
    }
    
}
