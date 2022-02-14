//
//  ListNewsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

final class ListNewsPresenter: NewsListViewToPresenterProtocol {
    
    // MARK: - Properties
    
    var view: NewsListPresenterToViewProtocol?
    var interactor: NewsListPresenterToInteractorProtocol?
    var router: NewsListPresenterToRouterProtocol?
    private var news: [NewsModel]?
    
    init(view: NewsListPresenterToViewProtocol, router: NewsListPresenterToRouterProtocol) {
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

extension ListNewsPresenter: NewsListInteractorToPresenterProtocol {
    func newsFetched(_ news: [NewsModel]) {
        self.news = news
        view?.showNews()
    }
    
    func theNewsFetchedFailed() {
        view?.showError()
    }
}
