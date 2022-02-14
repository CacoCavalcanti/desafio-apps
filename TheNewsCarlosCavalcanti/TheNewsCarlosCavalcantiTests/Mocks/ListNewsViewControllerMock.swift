//
//  ListNewsViewControllerMock.swift
//  TheNewsCarlosCavalcantiTests
//
//  Created by Carlos Roberto Cavalcanti on 14/02/22.
//

@testable import TheNewsCarlosCavalcanti
import UIKit

final class ListNewsViewControllerMock: NewsListViewControllerProtocol {
    
    var presenter: ListNewsPresenterProtocol?
    
    private(set) var hasCalledShowNews: Bool = false
    private(set) var hasCalledShowError: Bool = false
        
    func showNews() {
        hasCalledShowNews = true
    }
    
    func showError() {
        hasCalledShowError = true
    }
}
