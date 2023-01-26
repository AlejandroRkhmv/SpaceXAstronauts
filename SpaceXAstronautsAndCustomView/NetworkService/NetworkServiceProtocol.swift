//
//  NetworkServiceProtocol.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getData(completionHandler: @escaping ([Astronaut]) -> Void)
    func getImageData(urlString: String, completionHandler: @escaping (Data) -> Void)
}
