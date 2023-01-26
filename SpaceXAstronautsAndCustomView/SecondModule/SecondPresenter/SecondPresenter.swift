//
//  SecondPresenter.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

class SecondPresenter: SecondPresenterProtocol {
 
    weak var secondVC: SecondViewControllerProtocol?
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var urlImage: String?
    
    init(secondVC: SecondViewControllerProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, urlImage: String) {
        self.secondVC = secondVC
        self.networkService = networkService
        self.router = router
        self.urlImage = urlImage
    }
    
    func downloadImage() {
        guard let urlImage = urlImage else { return }
        
        networkService.getImageData(urlString: urlImage) { [weak self] data in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.secondVC?.updateImage(imageData: data)
            }
        }
    }
}
