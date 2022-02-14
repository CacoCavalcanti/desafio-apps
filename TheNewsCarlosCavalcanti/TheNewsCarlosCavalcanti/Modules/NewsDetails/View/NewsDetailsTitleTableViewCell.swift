//
//  NewsDetailsTitleTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

final class NewsDetailsTitleTableViewCell: UITableViewCell {
    
    // MARK: - Private Proprieties
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .detailsTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .detailsSubtitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var newsDetailsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.configure(style: .newsInfo, color: TNStyleGuide.Color.boldBlue)
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
    
    // MARK: - Private Methods
    
    func setupViews() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = false
        addSubviews(newsTitleLabel, newsSubtitleLabel, newsDetailsLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            newsTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            newsTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            newsSubtitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 8),
            newsSubtitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            newsSubtitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            newsDetailsLabel.topAnchor.constraint(equalTo: newsSubtitleLabel.bottomAnchor, constant: 16),
            newsDetailsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
            newsDetailsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32),
            newsDetailsLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
    }
    
    func getAttributedText(for news: NewsModel) -> NSMutableAttributedString {
        let releaseDate = Date.create(byTimeStamp: news.releaseDate)
        
        return NSMutableAttributedString()
            .light(string: "POR ")
            .black(string: "O GLOBO", color: TNStyleGuide.Color.blue)
            .light(string: "\n\(releaseDate)")
    }
}

extension NewsDetailsTitleTableViewCell {
    
    // MARK: - Public methods
    
    func setup(with news: NewsModel) {
        newsTitleLabel.text = news.title
        newsSubtitleLabel.text = news.subTitle
        newsDetailsLabel.attributedText = getAttributedText(for: news)
    }
}
