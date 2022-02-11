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
        return 1
    }
    
    func getNews(index: Int) -> NewsModel? {
        return NewsModel()
    }
    
}

extension ListNewsPresenter: NewsListInteractorToPresenterProtocol {
    
    func theNewsFetched() {
        print()
    }
    
    func theNewsFetchedFailed() {
        print()
    }
    
}
