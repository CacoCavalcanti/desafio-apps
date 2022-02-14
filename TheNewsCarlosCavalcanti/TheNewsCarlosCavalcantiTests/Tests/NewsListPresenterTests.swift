//
//  NewsListPresenterTests.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 14/02/22.
//

import XCTest
@testable import TheNewsCarlosCavalcanti

final class NewsListPresenterTests: XCTestCase {
    
    var presenter: ListNewsPresenterMock!
    var interactor: ListNewsInteractorMock!
    var view: ListNewsViewControllerMock!
    
    override func setUp() {
        super.setUp()
        presenter = ListNewsPresenterMock()
        interactor = ListNewsInteractorMock()
        view = ListNewsViewControllerMock()
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        interactor = nil
        view = nil
    }
    
    func test_updateView() {
        presenter.interactor = interactor
        interactor.fetchNews()
        XCTAssertTrue(interactor.hasCalledFetchNews)
    }
    
    func test_getNewsListCount() {
        _ = presenter.getNewsListCount()
        XCTAssertTrue(presenter.hasCalledGetNewsListCount)
    }
    
    func test_getNews() {
        _ = presenter.getNews(index: 0)
        XCTAssertTrue(presenter.hasCalledGetNews)
    }
    
    func test_newsFetched() {
        presenter.newsFetched([])
        XCTAssertTrue(presenter.hasCalledFetchedNews)
    }
    
    func test_newsFetchedFailed() {
        presenter.newsFetchedFailed()
        XCTAssertTrue(presenter.hasCalledNewsFailed)
    }
}
