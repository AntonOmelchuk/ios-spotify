//
//  PlaybackPresenter.swift
//  Spotify
//
//  Created by Anton Omelchuk on 27.10.2021.
//

import UIKit
import AVFoundation

protocol PlayerDataSource: AnyObject {
    var songName: String? { get }
    var subtitle: String? { get }
    var imageURL: URL? { get }
}

final class PlaybackPresenter {
    
    // MARK: - Properties
    
    static let shared = PlaybackPresenter()
    
    private var track: AudioTrack?
    private var tracks = [AudioTrack]()
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if !tracks.isEmpty {
            return tracks.first
        }
        
        return nil
    }
    
    var player: AVPlayer?
    
    // MARK - Functions
    
    func startPlayback(from viewController: UIViewController, track: AudioTrack) {
        guard let url = URL(string: track.preview_url ?? "") else { return }
        
        player = AVPlayer(url: url)
        player?.volume = 0.1
        
        let vc = PlayerViewController()
        self.track = track
        self.tracks = []
        vc.title = track.name
        vc.dataSource = self
        vc.delegate = self
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: { [weak self] in
            self?.player?.play()
        })
    }
    
    func startPlayback(from viewController: UIViewController, tracks: [AudioTrack]) {
        self.tracks = tracks
        self.track = nil
        let vc = PlayerViewController()
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension PlaybackPresenter: PlayerViewControllerDelegate {
    func didTapPlayPause() {
        if let player = player {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        }
    }
    
    func didTapForward() {
        if tracks.isEmpty {
            player?.pause()
        } else {
            
        }
    }
    
    func didTapBackward() {
        if tracks.isEmpty {
            player?.pause()
            player?.play()
        } else {
            
        }
    }
    
    func didSlideSlider(_ value: Float) {
        player?.volume = value
    }
    
    
}

extension PlaybackPresenter: PlayerDataSource {
    var songName: String? {
        return currentTrack?.name
    }
    
    var subtitle: String? {
        return currentTrack?.artists.first?.name
    }
    
    var imageURL: URL? {
        return URL(string: currentTrack?.album?.images.first?.url ?? "")
    }
    
    
}
