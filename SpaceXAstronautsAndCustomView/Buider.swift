//
//  Buider.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import UIKit

protocol BuilderProtocol {
    
    func createFirstView(router: RouterProtocol) -> UIViewController
    func createSecondView(urlImage: String, router: RouterProtocol) -> UIViewController
}


class Builder: BuilderProtocol {
    
    func createFirstView(router: RouterProtocol) -> UIViewController {
        let firstView = ViewController()
        let networkService = NetworkService()
        let firstPresenter = FiratPresenter(firstView: firstView, networkService: networkService, router: router)
        firstView.firstPresenter = firstPresenter
        return firstView
    }
    
    func createSecondView(urlImage: String, router: RouterProtocol) -> UIViewController {
        let secondVC = SecondViewController()
        let networkService = NetworkService()
        let secondPresenter = SecondPresenter(secondVC: secondVC, networkService: networkService, router: router, urlImage: urlImage)
        secondVC.secondPresenter = secondPresenter
        return secondVC
    }
}
