//
//  ListNewsPresenterMock.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

@testable import TheNewsCarlosCavalcanti
import UIKit

final class ListNewsPresenterMock: ListNewsPresenterProtocol, ListNewsPresenterDelegate {
    
    var view: NewsListViewControllerProtocol?
    var interactor: ListNewsInteractorProtocol?
    var router: NewsListRouterProtocol?
    
    private(set) var hasCalledUpdatedView: Bool = false
    private(set) var hasCalledGetNewsListCount: Bool = false
    private(set) var hasCalledGetNews: Bool = false
    private(set) var hasCalledShowNewsDetails: Bool = false
    private(set) var hasCalledGetCellType: Bool = false
    private(set) var hasCalledFetchedNews: Bool = false
    private(set) var hasCalledNewsFailed: Bool = false
    
    func updateView() {
        hasCalledUpdatedView = true
    }
    
    func getNewsListCount() -> Int? {
        hasCalledGetNewsListCount = true
        return 0
    }
    
    func getNews(index: Int) -> NewsModel? {
        hasCalledGetNews = true
        return nil
    }
    
    func showNewsDetails(controller: UINavigationController, with news: NewsModel) {
        hasCalledShowNewsDetails = true
    }
    
    func getCellType(for indexPath: IndexPath) -> UITableViewCell {
        hasCalledGetCellType = true
        return UITableViewCell()
    }
    
    func newsFetched(_ news: [NewsModel]) {
        hasCalledFetchedNews = true
    }
    
    func newsFetchedFailed() {
        hasCalledNewsFailed = true
    }
}
