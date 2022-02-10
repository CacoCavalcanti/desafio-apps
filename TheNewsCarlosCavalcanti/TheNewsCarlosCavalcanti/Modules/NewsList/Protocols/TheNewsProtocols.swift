//
//  TheNewsProtocols.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

protocol TheNewsListPresenterToViewProtocol: class {
    func showNews()
    func showError()
}

protocol TheNewsListInteractorToPresenterProtocol: class {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol TheNewsListPresentorToInteractorProtocol: class {
    var presenter: TheNewsListInteractorToPresenterProtocol? { get set }
//    var news: [TheNewsModel]? { get }
    
    func fetchTheNews()
}

protocol ViewToPresenterProtocol: class {
    var view: TheNewsListPresenterToViewProtocol? { get set }
    var interactor: TheNewsListPresentorToInteractorProtocol? { get set }
    var router: TheNewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
//    func getNews(index: Int) -> TheNewsModel?
}

protocol TheNewsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
