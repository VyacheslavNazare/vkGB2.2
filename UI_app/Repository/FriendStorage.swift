//
//  FriendStorage.swift
//  UI_app
//
//  Created by Вячеслав on 16.08.2021.
//

import Foundation

class FriendStorage {
    var friends: [FriendModel]
    let allFriends: [FriendModel]
    
    init() {
        friends = [
            FriendModel(name: "Иоганн Себастьян Бах", avatarName: "1.1", Gallery: [
                GalleryModel(imageGalley: "2.1"),
                GalleryModel(imageGalley: "3.1"),
                GalleryModel(imageGalley: "4.1"),
                GalleryModel(imageGalley: "2.1"),
                GalleryModel(imageGalley: "3.1"),
                GalleryModel(imageGalley: "4.1"),
                GalleryModel(imageGalley: "2.1"),
                GalleryModel(imageGalley: "3.1"),
                GalleryModel(imageGalley: "4.1"),
                GalleryModel(imageGalley: "2.1"),
                GalleryModel(imageGalley: "3.1"),
                GalleryModel(imageGalley: "4.1"),
                GalleryModel(imageGalley: "5.1")
            ]
            )
        ]
        
        allFriends = [
            FriendModel(name: "Вольфганг Амадей Моцарт", avatarName: "1", Gallery: [
                GalleryModel(imageGalley: "2"),
                GalleryModel(imageGalley: "3"),
                GalleryModel(imageGalley: "4")
            ]
            ),
            FriendModel(name: "Людвиг ван Бетховен", avatarName: "1.2", Gallery: [
                GalleryModel(imageGalley: "2.2"),
                GalleryModel(imageGalley: "3.2"),
                GalleryModel(imageGalley: "4.2")
            ]
            ),
            FriendModel(name: "Мусоргский Модест Петрович", avatarName: "1.3", Gallery: [
                GalleryModel(imageGalley: "2.3"),
                GalleryModel(imageGalley: "3.3"),
                GalleryModel(imageGalley: "4.3")
            ]
            ),
            FriendModel(name: "Сергей Прокофьев", avatarName: "1.4", Gallery: [
                GalleryModel(imageGalley: "2.4"),
                GalleryModel(imageGalley: "3.4")
            ]
            ),
            FriendModel(name: "Франц Петер Шуберт", avatarName: "1.5", Gallery: [
                GalleryModel(imageGalley: "2.5"),
                GalleryModel(imageGalley: "3.5"),
                GalleryModel(imageGalley: "4.5"),
                GalleryModel(imageGalley: "5.5")
            ]
            )
        ]
        }
}
