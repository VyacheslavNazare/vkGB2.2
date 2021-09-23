//
//  LoginViewWebVkController.swift
//  UI_app
//
//  Created by Вячеслав on 22.09.2021.
//

import UIKit
import WebKit
import Alamofire


final class LoginViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
        
        override func viewDidLoad() {
            getRequest()
            
        }
        
        func  getRequest() {
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "7958058"), //идентификатор
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "display", value: "mobile"),
                URLQueryItem(name: "scope", value: "friends,photos,groups"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "revoke", value: "1")
            ]
            let request = URLRequest(url: urlComponents.url!)
            webView.load(request)
        }
    
    let configuration = URLSessionConfiguration.default
        
        func getGroups() {
            
            let url = "https://api.vk.com/method/groups.get?user_id=" + MySession.shared.userId + "&fields=city,description,members_count,photo_100" + "&access_token=" + MySession.shared.token + "&v=5.131"

            
            AF.request(url).responseJSON{ response in
                print("Список групп:\n", response.value)
            }
            
        }
    
        func getFriends() {
            
            let url = "https://api.vk.com/method/friends.get?user_id=" + MySession.shared.userId + "&order=hints" + "&fields=nickname,bdate,city,photo_50" + "&access_token=" + MySession.shared.token + "&v=5.131"

            
            AF.request(url).responseJSON{ response in
                print("Список друзей:\n", response.value)
            }
            
        }
            
        func getGroupSearch() {
                let url = "https://api.vk.com/method/groups.search?user_id=" + MySession.shared.userId + "q,type,country_id,count" + "&access_token=" + MySession.shared.token + "&v=5.131"
                AF.request(url).responseJSON{ response in
                    print("Поиск групп:\n", response.value)
                
            }
         
        }
    }

    extension LoginViewController: WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
                     WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
                }
            MySession.shared.userId = params["user_id"]!
            MySession.shared.token = params["access_token"]!
            
            print("User ID = \(MySession.shared.userId)")
            print("Token = \(MySession.shared.token)")
            decisionHandler(.cancel)
            
            getGroups()
            getFriends()
        }
    }




