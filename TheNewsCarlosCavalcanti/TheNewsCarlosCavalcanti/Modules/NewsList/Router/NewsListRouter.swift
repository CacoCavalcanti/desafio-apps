//
//  NewsListRouter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

protocol NewsListRouterProtocol {
    func createModule() -> UIViewController
    func showNewsDetails(from controller: UINavigationController, with news: NewsModel)
}

final class NewsListRouter: NewsListRouterProtocol {
    var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = NewsListViewController()
        viewController = view
        let router: NewsListRouterProtocol = NewsListRouter()
        let presenter: NewsListViewToPresenterProtocol & ListNewsPresenteDelegate = ListNewsPresenter(view: view, router: router)
        let interactor: ListNewsInteractorProtocol = ListNewsInteractor(presenter: presenter)
       
        view.presenter = presenter
        presenter.interactor = interactor 
        
        return view
    }
    
    func showNewsDetails(from controller: UINavigationController, with news: NewsModel) {
        let newsDetails = NewsDetailsRouter.createModule(news: news)
        controller.pushViewController(newsDetails, animated: true)
    }
}
