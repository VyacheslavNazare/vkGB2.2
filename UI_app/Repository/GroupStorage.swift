//
//  GroupStorage.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import Foundation

class GroupStorage {
    var group: [GroupModel]
    let allGroup: [GroupModel]
    
    init() {
        group = [
            GroupModel(nameG: "Барышни", imageG: "1.7", galleryGroup: [
                GalleryGroupModel(imageGalleryGroup: "1.7"),
                GalleryGroupModel(imageGalleryGroup: "2.7"),
                GalleryGroupModel(imageGalleryGroup: "3.7"),
                GalleryGroupModel(imageGalleryGroup: "4.7"),
                GalleryGroupModel(imageGalleryGroup: "5.7"),
                GalleryGroupModel(imageGalleryGroup: "6.7"),
                GalleryGroupModel(imageGalleryGroup: "7.7")
            ]
            )
        ]
        
        allGroup = [
            GroupModel(nameG: "Инструменты", imageG: "1.8", galleryGroup: [
                GalleryGroupModel(imageGalleryGroup: "1.8"),
                GalleryGroupModel(imageGalleryGroup: "2.8"),
                GalleryGroupModel(imageGalleryGroup: "3.8"),
                GalleryGroupModel(imageGalleryGroup: "4.8"),
                GalleryGroupModel(imageGalleryGroup: "5.8"),
                GalleryGroupModel(imageGalleryGroup: "6.8"),
                GalleryGroupModel(imageGalleryGroup: "7.8"),
                GalleryGroupModel(imageGalleryGroup: "8.8"),
                GalleryGroupModel(imageGalleryGroup: "9.8"),
                GalleryGroupModel(imageGalleryGroup: "10.8")
            ]
            ),
            GroupModel(nameG: "Ноты", imageG: "1.6", galleryGroup: [
                GalleryGroupModel(imageGalleryGroup: "1.6"),
                GalleryGroupModel(imageGalleryGroup: "2.6"),
                GalleryGroupModel(imageGalleryGroup: "3.6"),
            ]
            )

        ]
        }
}

