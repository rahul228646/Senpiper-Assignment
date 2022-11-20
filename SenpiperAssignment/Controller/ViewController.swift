//
//  ViewController.swift
//  SenpiperAssignment
//
//  Created by rahul kaushik on 19/11/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private var Newstitles : [ArticleModel] = [ArticleModel]()

    
    private let newsTableView : UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.borderWidth = 2
        table.layer.cornerRadius = 10
        table.layer.borderColor = UIColor.systemBackground.cgColor
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        updateColors()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        updateColors()
        view.addSubview(newsTableView)
        newsTableView.frame = view.bounds
        newsTableView.delegate = self
        newsTableView.dataSource = self
        configureLayout()
        fetchData()
    }
    
    private func fetchData() {
        NewsManager.shared.getNews { result in
            switch result {
                case .success(let articles) :
                    self.Newstitles = articles
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                case .failure(let error) :
                    print(error)
            }
            
        }
    }
    
    private func updateColors() {
        if self.traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .systemBackground
            newsTableView.layer.borderColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00).cgColor
        } else {
      
            view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
            newsTableView.layer.borderColor = UIColor.white.cgColor
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Newstitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
        cell.config(title: Newstitles[indexPath.row].title, desc: Newstitles[indexPath.row].description, imageUrl: Newstitles[indexPath.row].urlToImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

            let vc = DetailedViewController()
            vc.configure(url: self.Newstitles[indexPath.row].url ?? "www.apple.in")
            self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

