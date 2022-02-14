//
//  NewsDetailsTextTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

final class NewsDetailsTextTableViewCell: UITableViewCell {
    
    // MARK: - Private Proprieties
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.configure(style: .detailsText, color: TNStyleGuide.Color.boldBlue)
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
    
    // MARK: - Private Methods
    
    func setupViews() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = false
        addSubviews(newsTextLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsTextLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            newsTextLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            newsTextLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            newsTextLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

extension NewsDetailsTextTableViewCell {
    
    // MARK: - Public Methods
    
    func setup(with news: NewsModel) {
        newsTextLabel.text = news.text
    }
}
