//
//  TitleHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by Anton Omelchuk on 24.10.2021.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Ppoperties
    
    static let identifier = "TitleHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .regular)
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 15, y: 0, width: width - 30, height: height)
    }
    
    // MARK: - Helper functions
    
    func configure(with title: String) {
        label.text = title
    }
}
