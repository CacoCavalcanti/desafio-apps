//
//  NewsDetailsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

protocol NewsDetailsPresenterProtocol {
    var news: NewsModel? { get }

    func getCellsNumber() -> Int
    func getNews() -> NewsModel?
    func didTapShareButton()
    func getCellType(for indexPath: IndexPath) -> UITableViewCell
}

final class NewsDetailsPresenter {
    
    // MARK: - Private Proprieties
    
    private(set) var news: NewsModel?
    private(set) var view: NewsDetailsViewControllerProtocol?
    private let numberOfCells = 3
    
    // MARK: - Init
    
    init(view: NewsDetailsViewControllerProtocol, news: NewsModel) {
        self.news = news
        self.view = view
    }
}

extension NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    
    // MARK: - Public Methods
    
    func getCellsNumber() -> Int {
        guard news != nil else { return 0 }
        return numberOfCells
    }
    
    func getNews() -> NewsModel? {
        return news
    }
    
    func didTapShareButton() {
        guard let url = news?.originalURL else {
            view?.showError()
            return
        }
        view?.showShareOptions(for: url)
    }
    
    func getCellType(for indexPath: IndexPath) -> UITableViewCell {
        var details: NewsDetailsCellType
        
        switch indexPath.row {
        case 0:
            details = .header
        case 1:
            details = .image
        default:
            details = .text
        }
        return details.detailsCellType
    }
}

enum NewsDetailsCellType {
    case header
    case image
    case text
    
    var detailsCellType: UITableViewCell {
        switch self {
        case .header:
            return NewsDetailsTitleTableViewCell()
        case .image:
            return NewsDetailsImageTableViewCell()
        case .text:
            return NewsDetailsTextTableViewCell()
        }
    }
}
