//
//  NewsListViewControllerTests.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 14/02/22.
//

import XCTest
@testable import TheNewsCarlosCavalcanti

final class NewsListViewControllerTests: XCTestCase {
    
    var view: ListNewsViewControllerMock!
    
    override func setUp() {
        super.setUp()
        view = ListNewsViewControllerMock()
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
    }
    
    func test_showNews() {
        view.showNews()
        XCTAssertTrue(view.hasCalledShowNews)
    }
    
    func test_showError() {
        view.showError()
        XCTAssertTrue(view.hasCalledShowError)
    }    
}
