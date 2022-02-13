//
//  TheNewsProtocols.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

protocol NewsListPresenterToViewProtocol: AnyObject {
    func showNews()
    func showError()
}

protocol NewsListInteractorToPresenterProtocol: AnyObject {
    func theNewsFetched()
    func theNewsFetchedFailed()
}

protocol NewsListPresenterToInteractorProtocol: AnyObject {
    var presenter: NewsListInteractorToPresenterProtocol? { get set }
    var news: [NewsModel]? { get }
    
    func fetchNews()
}

protocol NewsListViewToPresenterProtocol: AnyObject {
    var view: NewsListPresenterToViewProtocol? { get set }
    var interactor: NewsListPresenterToInteractorProtocol? { get set }
    var router: NewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> NewsModel?
    func showNewsDetails(controller: UINavigationController, with news: NewsModel)
}

protocol NewsListPresenterToRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    func createModule() -> UIViewController
    func showNewsDetails(from controller: UINavigationController, with news: NewsModel)
}
