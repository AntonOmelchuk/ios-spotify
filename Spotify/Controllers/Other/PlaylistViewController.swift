//
//  PlaylistViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 10.10.2021.
//

import UIKit

class PlaylistViewController: UIViewController {

    // MARK: - Properties
    
    private let playlist: Playlist
    
    // MARK: - Lifecycle
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Playlist"
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getPlaylistDetails(for: playlist) { result in
            DispatchQueue.main.async {
                switch result {
                case .success: break
                case .failure: break
                }
            }
        }
    }
}
