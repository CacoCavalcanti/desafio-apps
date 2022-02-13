//
//  NewsDetailsImageTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import Foundation
import UIKit

final class NewsDetailsImageTableViewCell: UITableViewCell {
    
    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageDetailsLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListTitle, color: TNStyleGuide.Color.white)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "NewsDetailsImageTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsDetailsImageTableViewCell {
    
    func setupViews() {
        addSubviews(newsImageView, imageDetailsLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
//            imageDetailsLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 32),
            imageDetailsLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 16),
            imageDetailsLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 16),
            imageDetailsLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor)
        ])
        
    }
}

extension NewsDetailsImageTableViewCell {
    func setup(with news: NewsModel) {
        let image = news.images.first
        newsImageView.setImage(fromURL: image?.url)
        imageDetailsLabel.text = news.images.description
    }
}
