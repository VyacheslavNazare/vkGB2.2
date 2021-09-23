//
//  Singleton.swift
//  UI_app
//
//  Created by Вячеслав on 20.09.2021.
//

import Foundation
import Alamofire


class MySession {
    
    static let shared = MySession()
    
    var token = ""
    var userId = ""
    
    
    
    private init(){}
}
