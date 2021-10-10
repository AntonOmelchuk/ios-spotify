//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func signInButtonHandler() {
        let authVC = AuthViewController()
        authVC.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        
        authVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    // MARK: - Helper Functions
    
    private func handleSignIn(success: Bool) {
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something went wrong when signing in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let mainAppTabVC = TabBarViewController()
        mainAppTabVC.modalPresentationStyle = .fullScreen
        present(mainAppTabVC, animated: true)
    }
    
    private func configure() {
        title = "Spotify"
        view.backgroundColor = .systemGreen
        
        view.addSubview(signInButton)
    }
    
    private func configureUI() {
        signInButton.frame = CGRect(x: 20, y: view.height - 50 - view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
        signInButton.addTarget(self, action: #selector(signInButtonHandler), for: .touchUpInside)
    }
}
