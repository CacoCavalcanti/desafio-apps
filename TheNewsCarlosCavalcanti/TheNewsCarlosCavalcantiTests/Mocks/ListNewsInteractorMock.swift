//
//  ListNewsInteractorMock.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

@testable import TheNewsCarlosCavalcanti

final class ListNewsInteractorMock: ListNewsInteractorProtocol {
    
    var presenter: ListNewsPresenterDelegate?
    var news: [NewsModel]?
    
    private(set) var hasCalledFetchNews: Bool = false
    
    func fetchNews() {
        presenter?.newsFetched([])
        hasCalledFetchNews = true
    }
}
