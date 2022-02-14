//
//  ListNewsTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

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
    
    private lazy var newsSectionLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListSection, color: TNStyleGuide.Color.grayActionColor)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListTitle, color: TNStyleGuide.Color.boldBlue)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
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
}

private extension ListNewsTableViewCell {
    
    // MARK: - PRivate Methods
    
    func setupViews() {
        addSubviews(newsImageView, newsSectionLabel, newsTitleLabel)
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
            newsSectionLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            newsSectionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 16),
            newsSectionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
            
        ])
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: newsSectionLabel.bottomAnchor, constant: 4),
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
        newsSectionLabel.text = news.section.name.uppercased()
        newsTitleLabel.text = news.title
    }
}

