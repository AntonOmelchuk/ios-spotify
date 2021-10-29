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
    
    var index = 0
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if let _ = self.playerQueue, !tracks.isEmpty {
            return tracks[index]
        }
        
        return nil
    }
    
    var playerVC: PlayerViewController?
    
    var player: AVPlayer?
    var playerQueue: AVQueuePlayer?
    
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
        self.playerVC = vc
    }
    
    func startPlayback(from viewController: UIViewController, tracks: [AudioTrack]) {
        self.tracks = tracks
        self.track = nil
        
        self.playerQueue = AVQueuePlayer(items: tracks.compactMap({
            guard let url = URL(string: $0.preview_url ?? "") else { return nil }
            
            return AVPlayerItem(url: url)
        }))
        self.playerQueue?.volume = 0.1
        self.playerQueue?.play()
        
        let vc = PlayerViewController()
        
        vc.dataSource = self
        vc.delegate = self
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        self.playerVC = vc
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
        } else if let player = playerQueue {
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
        } else if let _ = playerQueue {
            playerQueue?.advanceToNextItem()
            index += 1
            playerVC?.refreshUI()
        }
    }
    
    func didTapBackward() {
        if tracks.isEmpty {
            player?.pause()
            player?.play()
        } else if let firstItem = playerQueue?.items().first {
            playerQueue?.pause()
            playerQueue?.removeAllItems()
            playerQueue = AVQueuePlayer(items: [firstItem])
            playerQueue?.play()
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
