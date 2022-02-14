//
//  ListNewsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

protocol ListNewsPresenterProtocol {
    var view: NewsListViewControllerProtocol? { get set }
    var interactor: ListNewsInteractorProtocol? { get set }
    var router: NewsListRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> NewsModel?
    func showNewsDetails(controller: UINavigationController, with news: NewsModel)
    func getCellType(for indexPath: IndexPath) -> UITableViewCell
}

protocol ListNewsPresenterDelegate: AnyObject {
    func newsFetched(_ news: [NewsModel])
    func newsFetchedFailed()
}

final class ListNewsPresenter: ListNewsPresenterProtocol {
    
    // MARK: - Properties
    
    var view: NewsListViewControllerProtocol?
    var interactor: ListNewsInteractorProtocol?
    var router: NewsListRouterProtocol?
    private var news: [NewsModel]?
    
    init(view: NewsListViewControllerProtocol, router: NewsListRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Methods
    
    func updateView() {
        interactor?.fetchNews()
    }
    
    func getNewsListCount() -> Int? {
        return news?.count
    }
    
    func getNews(index: Int) -> NewsModel? {
        return news?[index]
    }
    
    func showNewsDetails(controller: UINavigationController, with news: NewsModel) {
        router?.showNewsDetails(from: controller, with: news)
    }
    
    func getCellType(for indexPath: IndexPath) -> UITableViewCell {
        var details: NewsListCellType
        
        switch indexPath.row {
        case 0:
            details = .cover
        default:
            details = .list
        }
        return details.listCellType
    }
    
}

extension ListNewsPresenter: ListNewsPresenterDelegate {
    func newsFetched(_ news: [NewsModel]) {
        self.news = news
        view?.showNews()
    }
    
    func newsFetchedFailed() {
        view?.showError()
    }
}

enum NewsListCellType {
    case cover
    case list
    
    var listCellType: UITableViewCell {
        switch self {
        case .cover:
            return ListNewsFirstTableViewCell()
        case .list:
            return ListNewsTableViewCell()
        }
    }
}

