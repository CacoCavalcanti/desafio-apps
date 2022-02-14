//
//  ListNewsInteractorMock.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

@testable import TheNewsCarlosCavalcanti

final class ListNewsInteractorMock: NewsListPresenterToInteractorProtocol {
    var presenter: ListNewsPresenteDelegate?
    
    var news: [NewsModel]?
    
    func fetchNews() {
        presenter?.theNewsFetched()
    }
    
    
}
