//
//  ExampleViewController.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpTableView()
        
        viewModel.fetchAllModel() {
            tableView.reloadData()
        }
    }

    // MARK: - SetUp Methods
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SimpleDisplayTableViewCell.self, forCellReuseIdentifier: "SimpleDisplayTableViewCell")
        tableView.register(PhoneCell.self, forCellReuseIdentifier: "PhoneCell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
                        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - TableView Data Source
extension ExampleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let modelContext = viewModel.modelContext(for: indexPath.section) else {
            assertionFailure("Missing model!")
            return UITableViewCell()
        }
        
        let cell: UITableViewCell
        
        switch modelContext.modelType {
        case .car:
            guard let carCell = tableView.dequeueReusableCell(withIdentifier: "SimpleDisplayTableViewCell", for: indexPath) as? SimpleDisplayTableViewCell else {
                assertionFailure("Error")
                return UITableViewCell()
            }
            
            viewModel.updateCarCell(carCell, at: indexPath)
            
            cell = carCell
        case .book:
            guard let bookCell = tableView.dequeueReusableCell(withIdentifier: "SimpleDisplayTableViewCell", for: indexPath) as? SimpleDisplayTableViewCell else {
                assertionFailure("Error")
                return UITableViewCell()
            }
            
            viewModel.updateBookCell(bookCell, at: indexPath)
            
            cell = bookCell
        case .phone:
            guard let phoneCell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as? PhoneCell else {
                assertionFailure("Error")
                return UITableViewCell()
            }
            
            viewModel.updatePhoneCell(phoneCell, at: indexPath)
            
            cell = phoneCell
        }
        
        return cell
    }
}

// MARK: - TableView Delegate
extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.headerTitle(for: section)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
