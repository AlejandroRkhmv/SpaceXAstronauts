//
//  Presenter.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

class FiratPresenter: FirstPresenterProtocol {
    
    weak var firstView: FirstViewProtocol?
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var astronauts: [Astronaut]?
    
    
    init(firstView: FirstViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.firstView = firstView
        self.networkService = networkService
        self.router = router
    }
    
    func getAstronauts() {
        networkService.getData() { [weak self]  astronauts in
            guard let self = self else { return }
            self.astronauts = astronauts
            DispatchQueue.main.async {
                self.firstView?.createPickerView()
            }
        }
    }
    
    func tapOnTheElement(tag: Int) {
        guard let urlImage = astronauts?[tag].image else { return }
        router?.showSecondVC(urlImage: urlImage)
    }
}
