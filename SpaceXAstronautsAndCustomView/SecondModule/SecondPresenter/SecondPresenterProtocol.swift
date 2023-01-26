//
//  SecondPresenterProtocol.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

protocol SecondPresenterProtocol: AnyObject {
    
    var urlImage: String? { get set }
    func downloadImage()
}
