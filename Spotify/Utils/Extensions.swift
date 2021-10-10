//
//  Extensions.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

// MARK: - UITabBarController

extension UITabBarController {
    
    func configureTabItem(forController controller: UIViewController, screenTitle: String, tabTitle: String, icon: UIImage) -> UINavigationController {
        controller.title = screenTitle
        controller.navigationItem.largeTitleDisplayMode = .always
        
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.tintColor = .label
        navigationController.tabBarItem = UITabBarItem(title: tabTitle, image: icon, tag: 1)
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}

// MARK: - UIView

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}
