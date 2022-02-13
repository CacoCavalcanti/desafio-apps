//
//  NewsList2.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

protocol NewsList2ViewControllerInput {
    func showNews()
    func showActivityShareNews()
}

final class NewsListViewController2: UIViewController {
    
    var presenter: NewsList2PesenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func didTapShareButton() {
        presenter?.didTapShareButton()
    }
    
    
    
}

extension NewsListViewController2: NewsList2ViewControllerInput {
    func showNews() {
        
    }
    
    func showActivityShareNews() {
        
    }
}
