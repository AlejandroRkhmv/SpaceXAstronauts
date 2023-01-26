//
//  RouterProtocol.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation
import UIKit

protocol RouterMain {
    
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    
    func initialFirstVC()
    func showSecondVC(urlImage: String)
}
