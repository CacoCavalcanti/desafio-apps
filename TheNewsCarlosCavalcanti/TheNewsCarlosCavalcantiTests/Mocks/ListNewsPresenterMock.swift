//
//  ListNewsPresenterMock.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

@testable import TheNewsCarlosCavalcanti

final class ListNewsPresenterMock: ListNewsPresenterDelegate {
    
    private(set) var hasCalledFetchedNews: Bool = false
    private(set) var hasCalledNewsFailed: Bool = false
    
    func theNewsFetched() {
        hasCalledFetchedNews = true
    }
    
    func theNewsFetchedFailed() {
        hasCalledNewsFailed = true
    }
}
