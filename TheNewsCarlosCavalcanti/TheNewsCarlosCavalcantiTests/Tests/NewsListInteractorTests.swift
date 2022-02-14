//
//  NewsListInteractorTests.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import XCTest
@testable import TheNewsCarlosCavalcanti

final class NewsListInteractorTests: XCTestCase {
    
    var presenter: ListNewsPresenterMock!
    var interactor: ListNewsInteractorMock!
    
    override func setUp() {
        super.setUp()
        presenter = ListNewsPresenterMock()
        interactor = ListNewsInteractorMock()
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        interactor = nil
    }
    
    func test_fetchNews() {
        interactor.presenter = presenter
        interactor.fetchNews()
        XCTAssertTrue(presenter.hasCalledFetchedNews)
    }
}
