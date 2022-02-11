//
//  TheNewsProtocols.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

protocol NewsListPresenterToViewProtocol: class {
    func showNews()
    func showError()
}

protocol NewsListInteractorToPresenterProtocol: class {
    func theNewsFetched()
    func theNewsFetchedFailed()
}

protocol NewsListPresentorToInteractorProtocol: class {
    var presenter: NewsListInteractorToPresenterProtocol? { get set }
    var news: [NewsListEntity]? { get }
    
    func fetchNews()
}

protocol NewsListViewToPresenterProtocol: class {
    var view: NewsListPresenterToViewProtocol? { get set }
    var interactor: NewsListPresentorToInteractorProtocol? { get set }
    var router: NewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> NewsModel?
}

protocol NewsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
