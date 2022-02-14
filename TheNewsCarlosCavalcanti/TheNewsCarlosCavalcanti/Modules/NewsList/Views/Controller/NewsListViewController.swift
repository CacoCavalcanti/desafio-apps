//
//  NewsListTableViewController.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import UIKit

final class NewsListViewController: UIViewController {
   
    // MARK: - Private Proprieties
    
    private lazy var newsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.tableFooterView = UIView(frame: .zero)
        table.separatorStyle = .none
        return table
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Public Properties
    
    var presenter: NewsListViewToPresenterProtocol?
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        fetchNews()
        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
    }
}

private extension NewsListViewController {
    
    // MARK: - Private Methods
    
    func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.setupNavigationBar(controller: self)
        navigationItem.title = "The News"
        
        let barsImage = UIImage.TNImage.sandwichBars
        let barsButton = UIButton()
        barsButton.setupNavigationItem(image: barsImage, withSize: 32)
        barsButton.tintColor = TNStyleGuide.Color.white
        let leftNavBarButton = UIBarButtonItem(customView: barsButton)
        navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    func setupTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        newsTableView.register(ListNewsTableViewCell.self, forCellReuseIdentifier: "ListNewsTableViewCell")
        newsTableView.register(ListNewsFirstTableViewCell.self, forCellReuseIdentifier: "ListNewsFirstTableViewCell")
        
        newsTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        ])
    }
    
    func setupIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.startAnimating()
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func fetchNews() {
        setupIndicatorView()
        presenter?.updateView()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 250 : 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let news = presenter?.getNews(index: indexPath.row),
              let navigation = self.navigationController else { return }
        presenter?.showNewsDetails(controller: navigation, with: news)
    }
}

extension NewsListViewController: NewsListPresenterToViewProtocol {
    func showNews() {
        view.addSubview(newsTableView)
        indicatorView.removeFromSuperview()
        setupTableView()
        newsTableView.reloadData()
    }
    
    func showError() {
        indicatorView.removeFromSuperview()
        let title = "Ocorreu um erro"
        let message = "Não foi possível carregar as notícias. Verifique sua conexão e tente novamente."
        UIAlertController.showTryAgainAlert(withTitle: title,
                                            message: message,
                                            forViewController: self,
                                            dismissHandler: nil,
                                            tryAgain: { [weak self] _ in self?.fetchNews() },
                                            dismissMessage: "OK")
    }
}
