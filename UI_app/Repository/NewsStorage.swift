//
//  NewsStorage.swift
//  UI_app
//
//  Created by Вячеслав on 08.09.2021.
//

import Foundation

class NewsStorage {
 
    let news: [NewsModel]
    
    init() {
        news = [
            NewsModel(imageNews: "n1", textNews: "Земля больше не плоская!"),
            NewsModel(imageNews: "n2", textNews: "Приходите на концерт")
        ]
        }
}


