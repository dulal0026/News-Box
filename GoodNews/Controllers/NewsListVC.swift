//
//  NewsListVC.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import UIKit

class NewsListVC: UITableViewController {
    
    var viewModel:ArticleListViewModel = ArticleListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "World News"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ArticleTableCell.self, forCellReuseIdentifier: "ArticleTableCell")
        setup()
        viewModel.delegate = self 
    }
    private func setup(){
       // navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell:ArticleTableCell = (tableView.dequeueReusableCell(withIdentifier: "ArticleTableCell", for: indexPath) as? ArticleTableCell) else {
            return UITableViewCell()
        }

        let articleVM = viewModel.articleAtIndex(indexPath.row)
        cell.fill(articleVM)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVM = viewModel.articleAtIndex(indexPath.row)
        let viewModel = ArticleDetailsViewModel(articleVM)
        let vc:ArticleDetailsVC = ArticleDetailsVC(viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension NewsListVC:ArticleListViewModelDelegate{
    
    func reloadData() {
        self.tableView.reloadData()
    }
}
