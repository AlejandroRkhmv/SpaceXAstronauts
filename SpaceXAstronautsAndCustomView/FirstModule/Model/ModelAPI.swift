//
//  ModelAPI.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

struct ModelAPI: Codable {
    
    let name: String?
    let agency: String?
    let image: String?
    let wikipedia: String?
    let launches: [String?]
    let status: String?
    let id: String?
}
