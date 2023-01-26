//
//  FirstPresenterProtocol.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

protocol FirstPresenterProtocol: AnyObject {
    
    var astronauts: [Astronaut]? { get set }
    func getAstronauts()
    func tapOnTheElement(tag: Int)
}
