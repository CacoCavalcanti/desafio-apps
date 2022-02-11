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
        table.register(ListNewsTableViewCell.self, forCellReuseIdentifier: "ListNewsTableViewCell")
        table.rowHeight = 152
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
        self.view.addSubview(newsTableView)
    }
    
    func setupConstraints() {
        newsTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        newsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListNewsTableViewCell") as? ListNewsTableViewCell else {
            return UITableViewCell()
        }
        return cell
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
