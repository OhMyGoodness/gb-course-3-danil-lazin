//
//  ViewController.swift
//  gb-course-3
//
//  Created by Данила Лазин on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if (Session.shared.tokenId == nil){
            performSegue(withIdentifier: "authVkSegue", sender: nil)
        }
    }

    @IBAction func unwindAuthAction(unwindSegue: UIStoryboardSegue) {
//        VkAPI.getFriendsList()
//        VkAPI.getPhotosList()
//        VkAPI.getGroupsList()
        VkAPI.getGroupsSearchList()
    }
}

