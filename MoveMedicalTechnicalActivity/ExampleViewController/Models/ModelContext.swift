//
//  ModelContext.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import Foundation

struct ModelContext {
    let headerTitle: String
    let modelType: ModelType
    let models: [BaseModel]
    
    func model<Model: BaseModel>(for index: Int) -> Model? {
        return models.safe(index: index) as? Model
    }
}

enum ModelType {
    case car
    case book
    case phone
}
