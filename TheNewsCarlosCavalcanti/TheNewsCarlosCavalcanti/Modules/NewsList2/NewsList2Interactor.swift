//
//  NewsList2Interactor.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

protocol NewsList2InteractorInput {
    func fetchNews()
}


protocol NewsList2InteractorOutput: AnyObject {
    func didFetchNews(news: [NewsModel])
}

final class NewsList2Interactor: NewsList2InteractorInput {
    
    weak var output: NewsList2InteractorOutput?
    
    init(output: NewsList2InteractorOutput?) {
        self.output = output
    }
    
    func fetchNews() {
        output?.didFetchNews(news: [])
    }
    
   
}
