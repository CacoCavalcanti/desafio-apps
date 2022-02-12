//
//  ListNewsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import Foundation

final class ListNewsPresenter: NewsListViewToPresenterProtocol {
           
    // MARK: - Properties
    
    weak var view: NewsListPresenterToViewProtocol?
    var interactor: NewsListPresentorToInteractorProtocol?
    var router: NewsListPresenterToRouterProtocol?
    
    // MARK: - Methods
    
    func updateView() {
        interactor?.fetchNews()
    }
    
    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }
    
    func getNews(index: Int) -> NewsModel? {
        return interactor?.news?[index]
    }
    
}

extension ListNewsPresenter: NewsListInteractorToPresenterProtocol {
    
    func theNewsFetched() {
        view?.showNews()
    }
    
    func theNewsFetchedFailed() {
        view?.showError()
    }
    
}
