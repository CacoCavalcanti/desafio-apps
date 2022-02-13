//
//  NewsDetailsTextTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import Foundation
import UIKit

final class NewsDetailsTextTableViewCell: UITableViewCell {
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "NewsDetailsTextTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsDetailsTextTableViewCell {
    
    func setupViews() {
        addSubviews(newsTextLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsTextLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 32),
            newsTextLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            newsTextLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 16),
            newsTextLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
    }
}

extension NewsDetailsTextTableViewCell {
    func setup(with news: NewsModel) {
        newsTextLabel.text = news.text
    }
}
