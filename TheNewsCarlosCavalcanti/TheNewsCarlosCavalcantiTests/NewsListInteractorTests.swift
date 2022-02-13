//
//  NewsListInteractorTests.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import XCTest
@testable import TheNewsCarlosCavalcanti

final class NewsListInteractorTests: XCTestCase {
    
    func test_fetchNews() {
        // given
        let presenter = ListNewsPresenterMock()
        let interactor = ListNewsInteractorMock()
        interactor.presenter = presenter
        
        // when
        interactor.fetchNews()
        
        // then
        XCTAssertTrue(presenter.hasCalledFetchedNews)
    }
}
