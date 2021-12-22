//
//  VkAPI.swift
//  gb-course-3
//
//  Created by Данила Лазин on 22.12.2021.
//

import SwiftUI

class VkAPI {
    static func getFriendsList(){
        let url = URL(string: "https://api.vk.com/method/friends.get?user_id=\(Session.shared.userId!)&v=\(Session.shared.version)&access_token=\(Session.shared.tokenId!)")
        
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                guard let dataStr = String(bytes: data!, encoding: String.Encoding.utf8) else { return }
                print("====== getFriendsList ======")
                print(dataStr)
            }
        }).resume()
    }
    
    static func getPhotosList(){
        let url = URL(string: "https://api.vk.com/method/photos.get?user_id=\(Session.shared.userId!)&v=\(Session.shared.version)&access_token=\(Session.shared.tokenId!)&album_id=wall")
        
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                guard let dataStr = String(bytes: data!, encoding: String.Encoding.utf8) else { return }
                print("====== getPhotosList ======")
                print(dataStr)
            }
        }).resume()
    }
    
    static func getGroupsList(){
        let url = URL(string: "https://api.vk.com/method/groups.get?user_id=\(Session.shared.userId!)&v=\(Session.shared.version)&access_token=\(Session.shared.tokenId!)")
        
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                guard let dataStr = String(bytes: data!, encoding: String.Encoding.utf8) else { return }
                print("====== getGroupsList ======")
                print(dataStr)
            }
        }).resume()
    }
    
    static func getGroupsSearchList(){
        let query = "user_id=\(Session.shared.userId!)&v=\(Session.shared.version)&access_token=\(Session.shared.tokenId!)&q=Авто"
        guard let encoded = (query as NSString).addingPercentEscapes(using: String.Encoding.windowsCP1251.rawValue) else { return }

        let url = URL(string: "https://api.vk.com/method/groups.search?" + encoded)
        
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                guard let dataStr = String(bytes: data!, encoding: String.Encoding.utf8) else { return }
                print("====== getGroupsSearchList ======")
                print(dataStr)
            }
        }).resume()
    }
}
