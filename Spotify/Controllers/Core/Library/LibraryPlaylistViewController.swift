//
//  LibraryPlaylistViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 29.10.2021.
//

import UIKit

class LibraryPlaylistViewController: UIViewController {
    
    // MARK: - Propertios
    
    private var playlists = [Playlist]()
    
    private let noPlaylistView = ActionLabelView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNoPlaylistView()
        fetchDate()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        noPlaylistView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        noPlaylistView.center = view.center
    }
    
    // MARK: - API
    
    func fetchDate() {
        APICaller.shared.getCurrentUserPlaylist { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlists):
                    self?.playlists = playlists
                    self?.updateUI()
                case .failure(let error):
                    print("DEBUG: getCurrentUserPlaylist error - \(error)")
                    break
                }
            }
        }
    }
    
    // MARK: - Helper Function
    
    private func setUpNoPlaylistView() {
        view.addSubview(noPlaylistView)
        noPlaylistView.delegate = self
        noPlaylistView.configureUI(with: ActionLabelViewViewModel(text: "You don't have any playlists yet.", actionTitle: "Create"))
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            noPlaylistView.isHidden = false
        } else {
            //
        }
    }
}

// MARK: - Extensions

extension LibraryPlaylistViewController: ActionLabelViewDelegate {
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        let alert = UIAlertController(title: "New Playlists", message: "Enter playlist name", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Playlist..."
            
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
            
            APICaller.shared.createPlaylist(with: text) { success in
                if success {
                    
                } else {
                    print("DEBUG: createPlaylist error - failed to create playlist")
                }
            }
        }))
    }
}
