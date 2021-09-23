//
//  News.swift
//  UI_app
//
//  Created by Вячеслав on 08.09.2021.
//

import Foundation

struct NewsModel {
    let imageNews: String
    let textNews: String
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

