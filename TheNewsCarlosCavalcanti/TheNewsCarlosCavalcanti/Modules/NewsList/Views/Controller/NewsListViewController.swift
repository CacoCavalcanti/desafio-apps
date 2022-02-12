//
//  NewsListTableViewController.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

final class NewsListViewController: UIViewController {
   
    // MARK: - Private Proprieties
    
    private var newsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.tableFooterView = UIView(frame: .zero)
        
        return table
    }()
    
    // MARK: - Public Properties
    
    var presenter: NewsListViewToPresenterProtocol?
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        setupTableView()
        setupConstraints()
        
    }
}

private extension NewsListViewController {
    
    // MARK: - Private Methods
    
    func setupTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        newsTableView.register(ListNewsTableViewCell.self, forCellReuseIdentifier: "ListNewsTableViewCell")
        newsTableView.register(ListNewsFirstTableViewCell.self, forCellReuseIdentifier: "ListNewsFirstTableViewCell")
        self.view.addSubview(newsTableView)
    }
    
    func setupConstraints() {
        newsTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        newsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        newsTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListNewsFirstTableViewCell") as? ListNewsFirstTableViewCell,
                  let newsModel = presenter?.getNews(index: indexPath.row) else {
                      return UITableViewCell()
                  }
            
            cell.setup(with: newsModel)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListNewsTableViewCell") as? ListNewsTableViewCell,
                  let newsModel = presenter?.getNews(index: indexPath.row) else {
                      return UITableViewCell()
                  }
            
            cell.setup(with: newsModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsListViewController: NewsListPresenterToViewProtocol {
    func showNews() {
        newsTableView.reloadData()
    }
    
    func showError() {
        print()
    }
}
