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

protocol NewsListViewToPresenterProtocol: AnyObject {
    var view: NewsListPresenterToViewProtocol? { get set }
    var interactor: ListNewsInteractorProtocol? { get set }
    var router: NewsListRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> NewsModel?
    func showNewsDetails(controller: UINavigationController, with news: NewsModel)
}

//protocol NewsListRouterProtocol: AnyObject {
//    var viewController: UIViewController? { get set }
//    
//    func createModule() -> UIViewController
//    func showNewsDetails(from controller: UINavigationController, with news: NewsModel)
//}
