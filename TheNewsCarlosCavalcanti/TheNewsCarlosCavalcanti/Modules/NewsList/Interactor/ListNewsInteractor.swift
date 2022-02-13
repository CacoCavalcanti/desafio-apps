//
//  ListNewsInteractor.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import Alamofire

final class ListNewsInteractor: NewsListPresenterToInteractorProtocol {
    
    // MARK: - Properties
    
    weak var presenter: NewsListInteractorToPresenterProtocol?
    private(set) var news: [NewsModel]?
    private let url = "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json"
    
    init(presenter: NewsListInteractorToPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    
    func fetchNews() {
        AF.request(url).responseData { (data) in
            switch data.result {
            case .success(let newsData):
                if let newsList = try? JSONDecoder().decode(NewsModelEntity.self, from: newsData) {
                    self.news = newsList.first?.content
                    self.presenter?.theNewsFetched()
                }
                
            case .failure(_):
                self.presenter?.theNewsFetchedFailed()
            }
        }
    }
}
