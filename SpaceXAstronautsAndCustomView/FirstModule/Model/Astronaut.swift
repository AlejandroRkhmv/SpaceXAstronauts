//
//  Astronaut.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

struct Astronaut: Codable {
    
    let name: String?
    let agency: String?
    let image: String?
    let wikipedia: String?
    
    init?(data: ModelAPI) {
        self.name = data.name
        self.agency = data.agency
        self.image = data.image
        self.wikipedia = data.wikipedia
    }
}
