//
//  Extensions.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

extension UITabBarController {
    
    func configureTabItem(forController controller: UIViewController, screenTitle: String, tabTitle: String, icon: UIImage) -> UINavigationController {
        controller.title = screenTitle
        controller.navigationItem.largeTitleDisplayMode = .always
        
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: tabTitle, image: icon, tag: 1)
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
