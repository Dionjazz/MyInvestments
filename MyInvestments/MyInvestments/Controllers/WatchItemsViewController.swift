//
//  ViewController.swift
//  MyInvestments
//
//  Created by Igor Sapaev on 29.03.2024.
//

import UIKit

class WatchItemsViewController: UIViewController {

    //MARK: Life cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchViewController()
        setupTitleview()
    }

    private func setupSearchViewController() {
        let resultVC = SearchResultsViewController()
        resultVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC

    }
    
    //MARK: Private
    
    private func setupTitleview() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        titleView.backgroundColor = .link
        navigationItem.titleView = titleView
        
        let label = UILabel(frame:CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Investment"
        label.font = .systemFont(ofSize: 36, weight: .medium)
        titleView.addSubview(label)
        
    }
    
}

extension WatchItemsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resulVC = searchController.searchResultsController as? SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        print (query)
    }
}

extension WatchItemsViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResult: String) {
        // Stock details
    }
}
