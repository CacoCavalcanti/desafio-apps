//
//  NewsDetailsRouter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

protocol NewsDetailsRouterProtocol {
    static func createModule(news: NewsModel) -> NewsDetailsViewController
}

final class NewsDetailsRouter: NewsDetailsRouterProtocol {
    
    static func createModule(news: NewsModel) -> NewsDetailsViewController {
        let view = NewsDetailsViewController()
        let presenter: NewsDetailsPresenterProtocol = NewsDetailsPresenter(view: view, news: news)
        view.presenter = presenter
        return view
    }
}
