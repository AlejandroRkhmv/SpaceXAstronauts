//
//  Router.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation
import UIKit

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialFirstVC() {
        if let navigationController = navigationController {
            guard let firstVC = builder?.createFirstView(router: self) else { return }
            navigationController.viewControllers = [firstVC]
        }
    }
    
    func showSecondVC(urlImage: String) {
        if let navigationController = navigationController {
            guard let secondVC = builder?.createSecondView(urlImage: urlImage, router: self) else { return }
                    navigationController.pushViewController(secondVC, animated: false)
        }
    } 
}
