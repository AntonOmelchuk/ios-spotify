//
//  AlbumViewController.swift
//  Spotify
//
//  Created by Anton Omelchuk on 12.10.2021.
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - Properties
    
    private let album: Album
    
    // MARK: - Lifecycle
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Album"
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getAlbumDetails(for: album) { result in
            DispatchQueue.main.async {
//                switch result {
//                case .success(): break
//                case .failure(): break
//                }
            }
        }
    }
}
