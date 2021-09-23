//
//  GalleryGroup.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import Foundation

struct GalleryGroupModel {
    let imageGalleryGroup: String
    var isLike = false {
        didSet {
            if isLike {
                countLike += 1
            } else {
                countLike -= 1
                
            }
        }
    }
    var countLike = Int.random(in: 1...100)
}
