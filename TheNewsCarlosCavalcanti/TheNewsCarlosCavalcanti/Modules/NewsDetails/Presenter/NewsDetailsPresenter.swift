//
//  NewsDetailsPresenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

protocol NewsDetailsPresenterProtocol {
    var news: NewsModel? { get }

    func getCellsNumber() -> Int
    func getNews() -> NewsModel?
}

final class NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    
    var news: NewsModel?
    var view: NewsDetailsViewControllerProtocol?
    
    init(view: NewsDetailsViewControllerProtocol, news: NewsModel) {
        self.news = news
        self.view = view
    }
    
    func getCellsNumber() -> Int {
        return 3
    }
    
    func getNews() -> NewsModel? {
        return news
    }
    
}
