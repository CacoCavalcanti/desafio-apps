//
//  NewsDetailsImageTableViewCell.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

final class NewsDetailsImageTableViewCell: UITableViewCell {
    
    // MARK: - Private Proprieties
    
    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageDetailsLabel: UILabel = {
        let label = UILabel()
        label.configure(style: .detailsImageSubtitle, color: TNStyleGuide.Color.white)
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
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let frame = superview?.frame {
            makeGradient(from: frame)
        }
    }
}

private extension NewsDetailsImageTableViewCell {
    
    // MARK: - Private Methods
    
    func setupViews() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = false
        addSubviews(newsImageView, imageDetailsLabel)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: self.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageDetailsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            imageDetailsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            imageDetailsLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -8)
        ])
    }
    
    func makeGradient(from frame: CGRect) {
        let rect = CGRect(x: 0, y: 0, width: frame.width, height: 250)
        let gradient = CAGradientLayer()
        gradient.frame = rect
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0.4)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        newsImageView.layer.addSublayer(gradient)
    }
}

extension NewsDetailsImageTableViewCell {
    
    // MARK: - Public Methods
    
    func setup(with news: NewsModel) {
        guard let image = news.images.first else { return }
        newsImageView.setImage(fromURL: image.url)
        
        let separationChart = (image.subtitle.isEmpty) || (image.source.isEmpty) ? "" : "-"
        let subtitle = "\(image.subtitle) \(separationChart) \(image.source)"
        imageDetailsLabel.text = subtitle
    }
}
