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

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        return dateFormatter
    }()
    
    static let displayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter
    }()
}

extension String {
    static func formattedDate(string: String) -> String {
        guard let date = DateFormatter.dateFormatter.date(from: string) else {
            return string
        }
        return DateFormatter.displayDateFormatter.string(from: date)
    }
}

extension Notification.Name {
    static let albumSavedNotification = Notification.Name("albumSavedNotification")
}
