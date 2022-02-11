//
//  ListNewsInteractor.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import Alamofire

final class ListNewsInteractor: NewsListPresentorToInteractorProtocol {
    
    // MARK: - Properties
    
    var presenter: NewsListInteractorToPresenterProtocol?
    private(set) var news: [NewsListEntity]?
    private let url = "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json"
    
    // MARK: - Methods
    
    func fetchNews() {
        AF.request(url).responseData { (data) in
            switch data.result {
            case .success(let newsData):
                if let newsList: [NewsListEntity] = try? JSONDecoder().decode(NewsModel.self, from: newsData) {
                    self.news = newsList
                    self.presenter?.theNewsFetched()
                }
                
            case .failure(_):
                self.presenter?.theNewsFetchedFailed()
            }
        }
    }
}
