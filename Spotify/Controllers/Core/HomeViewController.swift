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
        fetchData()
    }
    
    // MARK: - Selectors
    
    @objc func didTapSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        settingsVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    // MARK: - API
    
    func fetchData() {
        APICaller.shared.getRecommenedGenres { result in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                while seeds.count < 5 {
                    if let randomEl = genres.randomElement() {
                        seeds.insert(randomEl)
                    }
                }
                
                APICaller.shared.getRecommendations(genres: seeds) { result in
                  
                }
                break
            case .failure(let error):
                print("DEBUG: HomeViewController - fetchData error \(error.localizedDescription)")
                break
            }
        }
    }
    
    // MARK: - Helper Functions
    
    
    func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
    }
}
