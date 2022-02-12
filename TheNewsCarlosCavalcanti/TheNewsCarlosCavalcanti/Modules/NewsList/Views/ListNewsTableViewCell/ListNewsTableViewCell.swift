//
//  ListNewsTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

final class ListNewsTableViewCell: UITableViewCell {
    
    // MARK: - Private Proprieties

    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var newsSection: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListSection, color: TNStyleGuide.Color.grayActionColor)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "ListNewsTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
}

private extension ListNewsTableViewCell {
    
    // MARK: - PRivate Methods
    
    func setupViews() {
        addSubviews(newsImageView, newsSection, newsTitleLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            newsImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            newsImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8),
            newsImageView.widthAnchor.constraint(equalToConstant: self.frame.width / 3)
        ])
        
        NSLayoutConstraint.activate([
            newsSection.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            newsSection.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 16),
            newsSection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
            
        ])
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: newsSection.bottomAnchor, constant: 8),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 16),
            newsTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            newsTitleLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
    }
}

extension ListNewsTableViewCell {
    
    // MARK: - View Configuration
    
    func setup(with news: NewsModel) {
        let image = news.images.first
        newsImageView.setImage(fromURL: image?.url)
        newsSection.text = news.section.name.uppercased()
        newsTitleLabel.text = news.title
        
        backgroundColor = .white
    }
}

