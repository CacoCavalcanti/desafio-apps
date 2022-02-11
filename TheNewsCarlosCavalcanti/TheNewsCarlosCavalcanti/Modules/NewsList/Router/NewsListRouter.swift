//
//  NewsListRouter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import Foundation
import UIKit

final class NewsListRouter: NewsListPresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        
        let view = NewsListViewController()
        let presenter: NewsListViewToPresenterProtocol & NewsListInteractorToPresenterProtocol = ListNewsPresenter()
        let interactor: NewsListPresentorToInteractorProtocol = ListNewsInteractor()
        let router: NewsListPresenterToRouterProtocol = NewsListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
