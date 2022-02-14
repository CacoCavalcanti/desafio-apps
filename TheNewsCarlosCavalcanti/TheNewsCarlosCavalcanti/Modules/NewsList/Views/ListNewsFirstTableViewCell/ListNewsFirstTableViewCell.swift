//
//  ListNewsFirstTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

final class ListNewsFirstTableViewCell: UITableViewCell {
   
    // MARK: - Private Proprieties

    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var newsSectionLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListCoverSection, color: TNStyleGuide.Color.white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .newsListCoverTitle, color: TNStyleGuide.Color.white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "ListNewsFirstTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let frame = superview?.frame {
            makeGradient(from: frame)
        }
    }
}

private extension ListNewsFirstTableViewCell {
    
    // MARK: - PRivate Methods
    
    func setupViews() {
        addSubviews(newsImageView, newsSectionLabel, newsTitleLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            newsImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            newsTitleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            newsTitleLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -16),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 32),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -32),
        ])
        
        NSLayoutConstraint.activate([
            newsSectionLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            newsSectionLabel.bottomAnchor.constraint(equalTo: newsTitleLabel.topAnchor, constant: -8)
        ])
    }
    
    func makeGradient(from frame: CGRect) {
        let rect = CGRect(x: 0, y: 0, width: frame.width, height: 250)
        let gradient = CAGradientLayer()
        gradient.frame = rect
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        newsImageView.layer.addSublayer(gradient)
    }
}

extension ListNewsFirstTableViewCell {
    
    // MARK: - View Configuration
    
    func setup(with news: NewsModel) {
        let image = news.images.first
        newsImageView.setImage(fromURL: image?.url)
        newsSectionLabel.text = news.section.name
        newsTitleLabel.text = news.title
    }
}
