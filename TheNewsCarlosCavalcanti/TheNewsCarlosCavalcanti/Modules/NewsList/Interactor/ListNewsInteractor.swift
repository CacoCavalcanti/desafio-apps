//
//  ListNewsInteractor.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import Alamofire

final class ListNewsInteractor {
    
    static func getNewsList(urls: String, completion: @escaping ([NewsListEntity]?, Error?) -> Void)  {
        AF.request(urls).responseData { (data) in
            switch data.result {
            case .success(let newsData):
                if let newsList: [NewsListEntity] = try? JSONDecoder().decode(NewsModel.self, from: newsData) {
                    completion(newsList, nil)
                }
                
            case .failure(let error):
                completion(nil, error)
                print("Failure! \(error.localizedDescription)")
            }
        }
    }
}
