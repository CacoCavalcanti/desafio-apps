//
//  ListNewsInteractor.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Alamofire

protocol ListNewsInteractorProtocol {
    func fetchNews()
}

final class ListNewsInteractor: ListNewsInteractorProtocol {
    
    // MARK: - Properties
    
    weak var presenter: ListNewsPresenterDelegate?
    private let url = "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json"
    
    init(presenter: ListNewsPresenterDelegate) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    
    func fetchNews() {
        AF.request(url).responseData { (data) in
            switch data.result {
            case .success(let newsData):
                if let newsList = try? JSONDecoder().decode(NewsModelEntity.self, from: newsData) {
                    guard let news = newsList.first?.content else { return }
                    self.presenter?.newsFetched(news)
                }
                
            case .failure(_):
                self.presenter?.newsFetchedFailed()
            }
        }
    }
}
