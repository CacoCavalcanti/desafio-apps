//
//  NewsListTableViewController.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation
import UIKit

final class NewsListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var newsTableView: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.register(ListNewsTableViewCell.self, forCellReuseIdentifier: "ListNewsTableViewCell")
       table.rowHeight = 152
       table.tableFooterView = UIView(frame: .zero)
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        self.view.addSubview(newsTableView)
    }
    
    fileprivate func setupConstraints() {
        newsTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)

        newsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListNewsTableViewCell") as? ListNewsTableViewCell else {
             return UITableViewCell()
         }
         return cell
    }
}
