//
//  NewsList2Pesenter.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

protocol NewsList2PesenterInput {
    func viewDidLoad()
    func didTapShareButton()
}



final class NewsList2Pesenter: NewsList2PesenterInput {
    
//    var interactor: NewsList2InteractorInput? = NewsList2Interactor(output: self)
//    weak var viewController: NewsList2ViewControllerInput?
    
//    func viewDidLoad() {
//        
//        interactor?.fetchNews()
//    }
//    
//    func didTapShareButton() {
//        viewController?.showActivityShareNews()
//    }
}

extension NewsList2Pesenter: NewsList2InteractorOutput {
    func didFetchNews(news: [NewsModel]) {
        viewController?.showNews()
    }
}


