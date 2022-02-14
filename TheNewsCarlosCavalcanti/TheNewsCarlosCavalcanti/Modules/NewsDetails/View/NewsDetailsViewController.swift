//
//  NewsDetailsViewController.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 13/02/22.
//

import UIKit

protocol NewsDetailsViewControllerProtocol {
    func reloadData()
    func showShareOptions(for url: String)
    func showError()
    func didTapShareButton()
}

final class NewsDetailsViewController: UIViewController {
    
    // MARK: - Private Proprieties
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = UITableView.automaticDimension
        table.tableFooterView = UIView(frame: .zero)
        
        return table
    }()
        
    var presenter: NewsDetailsPresenterProtocol?
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationController()
        setupViews()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.backButtonDisplayMode = .minimal
    }
}

private extension NewsDetailsViewController {
    
    // MARK: - Private Methods
    
    func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.setupNavigationBar(controller: self)
        navigationItem.title = presenter?.news?.section.name
    
        let shareButton: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:.action, target: self, action: #selector(didTapShareButton))
        self.navigationItem.rightBarButtonItem = shareButton
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(NewsDetailsTitleTableViewCell.self, forCellReuseIdentifier: "NewsDetailsTitleTableViewCell")
        tableView.register(NewsDetailsImageTableViewCell.self, forCellReuseIdentifier: "NewsDetailsImageTableViewCell")
        tableView.register(NewsDetailsTextTableViewCell.self, forCellReuseIdentifier: "NewsDetailsTextTableViewCell")
        
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        ])
    }
}

extension NewsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCellsNumber() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let news = presenter?.getNews() else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsTitleTableViewCell") as? NewsDetailsTitleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(with: news)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsImageTableViewCell") as? NewsDetailsImageTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(with: news)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsTextTableViewCell") as? NewsDetailsTextTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(with: news)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 250
        default:
            return UITableView.automaticDimension
        }
    }
}

extension NewsDetailsViewController: NewsDetailsViewControllerProtocol {
    @objc func didTapShareButton() {
        presenter?.didTapShareButton()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showShareOptions(for url: String) {
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
    func showError() {
        let title = "Ocorreu um erro"
        let message = "Ocorreu um erro. Por favor, tente novamente."
        UIAlertController.showGenericOneOptionAlert(onViewController: self,
                                                    title: title,
                                                    message: message,
                                                    optionButtonText: "ok",
                                                    optionHandler: nil)
    }
}
