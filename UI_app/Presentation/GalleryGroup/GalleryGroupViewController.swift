//
//  GalleryGroupViewController.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import UIKit

final class GalleryGroupViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var galleryGroups: [GalleryGroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.tintColor = UIColor.black
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension GalleryGroupViewController: UICollectionViewDelegate {
    
}

extension GalleryGroupViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryGroupViewCell.identifier, for: indexPath) as! GalleryGroupViewCell
        
        
        let galleryGroup = galleryGroups[indexPath.item]
        cell.configure(galleryGroup)
        cell.likeTapped = { [weak self] islike in
            self?.galleryGroups[indexPath.item].isLike = islike
        }
        return cell
    }
    
    
    
}
