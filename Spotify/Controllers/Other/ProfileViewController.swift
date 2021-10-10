//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        getCurrentUser()
    }
    
    // MARK: - API
    
    func getCurrentUser() {
        APICaller.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                print("DEBUG: Error get current user \(error.localizedDescription)")
            }
        }
    }
}
