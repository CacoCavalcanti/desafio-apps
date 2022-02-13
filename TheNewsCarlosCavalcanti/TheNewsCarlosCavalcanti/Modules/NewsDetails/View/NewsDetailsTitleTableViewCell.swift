//
//  NewsDetailsTitleTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import Foundation
import UIKit

final class NewsDetailsTitleTableViewCell: UITableViewCell {
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListCoverTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var newsDetailsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "NewsDetailsTitleTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsDetailsTitleTableViewCell {
    
    // MARK: - PRivate Methods
    
    func setupViews() {
        addSubviews(newsTitleLabel, newsSubtitleLabel, newsDetailsLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 32),
            newsTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            newsTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            newsSubtitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.topAnchor, constant: 16),
            newsSubtitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            newsSubtitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            newsDetailsLabel.topAnchor.constraint(equalTo: newsSubtitleLabel.topAnchor, constant: 32),
            newsDetailsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            newsDetailsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 32)
        ])
    }
    
}

extension NewsDetailsTitleTableViewCell {
    
    // MARK: - View Configuration
    
    func setup(with news: NewsModel) {
        let image = news.images.first
        newsTitleLabel.text = news.title
        newsSubtitleLabel.text = news.subTitle
        newsDetailsLabel.text = news.releaseDate
    }
}
