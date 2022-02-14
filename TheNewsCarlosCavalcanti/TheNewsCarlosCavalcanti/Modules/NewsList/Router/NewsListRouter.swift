//
//  NewsListRouter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import UIKit

final class NewsListRouter: NewsListPresenterToRouterProtocol {
    var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = NewsListViewController()
        viewController = view
        let router: NewsListPresenterToRouterProtocol = NewsListRouter()
        let presenter: NewsListViewToPresenterProtocol & NewsListInteractorToPresenterProtocol = ListNewsPresenter(view: view, router: router)
        let interactor: NewsListPresenterToInteractorProtocol = ListNewsInteractor(presenter: presenter)
       
        view.presenter = presenter
        presenter.interactor = interactor 
        
        return view
    }
    
    func showNewsDetails(from controller: UINavigationController, with news: NewsModel) {
        let newsDetails = NewsDetailsRouter.createModule(news: news)
        controller.pushViewController(newsDetails, animated: true)
    }
}
