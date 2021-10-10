//
//  TabBarViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // MARK: - Helper Functions
    
    func configure() {
        view.backgroundColor = .white
        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let libraryViewController = LibraryViewController()
        
        setViewControllers([
            self.configureTabItem(forController: homeViewController, screenTitle: "Browse", tabTitle: "Home", icon: UIImage(systemName: "house")!),
            self.configureTabItem(forController: searchViewController, screenTitle: "Search", tabTitle: "Search", icon: UIImage(systemName: "magnifyingglass")!),
            self.configureTabItem(forController: libraryViewController, screenTitle: "Library", tabTitle: "Library", icon: UIImage(systemName: "music.note.list")!),
        ], animated: false)
    }
}
