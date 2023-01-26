//
//  SecondViewController.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    let imageView = UIImageView()
    var secondPresenter: SecondPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createImageView()
    }
    
    private func getImage() {
        secondPresenter.downloadImage()
    }
    
    private func createImageView() {
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width - 20, height: view.bounds.size.height - 100)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
}

extension SecondViewController: SecondViewControllerProtocol {
    
    func updateImage(imageData: Data) {
        imageView.image = UIImage(data: imageData)
    }
}
