//
//  ViewModel.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import Foundation

struct ViewModel {
    
    var modelContexts: [ModelContext] = []
    
    // MARK: - Getters
    var numberOfSections: Int {
        return modelContexts.count > 0 ? modelContexts.count : 1
    }
    
    func rowCount(for section: Int) -> Int {
        return modelContexts.safe(index: section)?.models.count ?? 0
    }
    
    func headerTitle(for section: Int) -> String? {
        return modelContexts.safe(index: section)?.headerTitle
    }
    
    func modelContext(for section: Int) -> ModelContext? {
        return modelContexts.safe(index: section)
    }
        
    // MARK: - Setters
    mutating func fetchAllModel(completion: () -> Void) {
        
        let car1 = Car(name: "Honda", description: "Quality car!", model: "Civic")
        let car2 = Car(name: "Tesla", description: "Electric car!", model: "X")
        let car3 = Car(name: "Ferrari", description: "Fast car!", model: "488")
        
        let carContext = ModelContext(headerTitle: "Cars", modelType: .car, models: [car1, car2, car3])
        
        let book1 = Book(name: "Great Gatsby", description: "An interesting book!", numberOfPages: 500)
        let book2 = Book(name: "1984",
                         description: "A very loong description A very loong description A very loong description A very loong description A very loong description",
                         numberOfPages: 300)
        
        let bookContext = ModelContext(headerTitle: "Books", modelType: .book, models: [book1, book2])
        
        let phone1 = Phone(name: "Kevin", description: "", digits: 3213322321)
        let phone2 = Phone(name: "Dustin", description: "", digits: 3213322321)
        
        let phoneContext = ModelContext(headerTitle: "Phone Numbers", modelType: .phone, models: [phone1, phone2])
        
        modelContexts = [carContext, bookContext, phoneContext]
    }
    
    func updateCarCell(_ cell: SimpleDisplayTableViewCell, at indexPath: IndexPath) {
        guard let modelContext = modelContext(for: indexPath.section),
            let model: Car = modelContext.model(for: indexPath.row) else {
                return
        }
        
        cell.simpleView.titleLabel.text = model.name
        cell.simpleView.subTitleLabel.text = model.model
        cell.simpleView.descriptionLabel.text = model.description
    }
    
    func updateBookCell(_ cell: SimpleDisplayTableViewCell, at indexPath: IndexPath) {
        guard let modelContext = modelContext(for: indexPath.section),
            let model: Book = modelContext.model(for: indexPath.row) else {
                return
        }
        
        cell.simpleView.titleLabel.text = model.name
        cell.simpleView.subTitleLabel.text = String(model.numberOfPages)
        cell.simpleView.descriptionLabel.text = model.description
    }
    
    func updatePhoneCell(_ cell: PhoneCell, at indexPath: IndexPath) {
        guard let modelContext = modelContext(for: indexPath.section),
            let model: Phone = modelContext.model(for: indexPath.row) else {
                return
        }
        
        cell.nameLabel.text = model.name
        cell.phoneLabel.text = "Phone No: \(model.digits)"
    }
}
