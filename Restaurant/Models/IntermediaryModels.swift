//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Ahmad Nader on 8/08/23.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}

