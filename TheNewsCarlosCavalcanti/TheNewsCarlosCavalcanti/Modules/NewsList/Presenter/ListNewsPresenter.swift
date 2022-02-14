//
//  ListNewsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

protocol ListNewsPresenterProtocol {
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> NewsModel?
    func showNewsDetails(controller: UINavigationController, with news: NewsModel)
}

protocol ListNewsPresenteDelegate: AnyObject {
    func newsFetched(_ news: [NewsModel])
    func newsFetchedFailed()
}

final class ListNewsPresenter: NewsListViewToPresenterProtocol {
    
    // MARK: - Properties
    
    var view: NewsListPresenterToViewProtocol?
    var interactor: ListNewsInteractorProtocol?
    var router: NewsListRouterProtocol?
    private var news: [NewsModel]?
    
    init(view: NewsListPresenterToViewProtocol, router: NewsListRouterProtocol) {
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
    
}

extension ListNewsPresenter: ListNewsPresenteDelegate {
    func newsFetched(_ news: [NewsModel]) {
        self.news = news
        view?.showNews()
    }
    
    func newsFetchedFailed() {
        view?.showError()
    }
}

