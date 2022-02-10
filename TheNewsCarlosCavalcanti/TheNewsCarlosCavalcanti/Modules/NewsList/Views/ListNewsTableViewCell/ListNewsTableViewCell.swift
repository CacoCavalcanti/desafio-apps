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

    private lazy var newsImageLabel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "ListNewsTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListNewsTableViewCell {
    
    // MARK: - PRivate Methods
    
    private func setupViews() {
        addSubviews(newsImageLabel, newsTitleLabel, newsTextLabel)
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsImageLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            newsImageLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            newsImageLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageLabel.trailingAnchor, constant: 16),
            newsTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
            
        ])
        
        NSLayoutConstraint.activate([
            newsTextLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 8),
            newsTextLabel.leadingAnchor.constraint(equalTo: newsImageLabel.leadingAnchor, constant: 16),
            newsTextLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            newsTextLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
        
        //        newsTitleLabel.setContentHuggingPriority(.init(rawValue: 252), for: .vertical)
        //        newsTitleLabel.setContentCompressionResistancePriority(.init(rawValue: 751), for: .vertical)
    }
}

  // MARK: - View Configuration
//  extension ListNewsTableViewCell {
//    public func configureCard(with type: CardType) {
//      let model = CardModel.getCardDetails(for: type)
//      newsImageLabel.image = UIImage(named: model.imageName)
//      newsTextLabel.text = model.characterName
//      backgroundColor = model.backgroundColor
//    }
//  }
//}
