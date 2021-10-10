//
//  HomeViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Selectors
    
    @objc func didTapSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        settingsVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    // MARK: - Helper Functions
    
    func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
    }
}
