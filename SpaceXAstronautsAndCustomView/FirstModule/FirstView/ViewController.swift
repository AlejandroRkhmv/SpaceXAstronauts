//
//  ViewController.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var firstPresenter: FirstPresenterProtocol!
    let pickerView = PickerView()
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createActivitiIndicator()
        getDataForPickerView()
    }
    
    func createActivitiIndicator() {
        activityIndicator.center = view.center
        activityIndicator.tintColor = .black
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
}

extension ViewController: FirstViewProtocol {
    
    func getDataForPickerView() {
        firstPresenter.getAstronauts()
    }
    
    func createPickerView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else { return }
            self.pickerView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 20, height: self.view.bounds.size.height - 120)
            self.pickerView.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 30)
            self.pickerView.dataSource = self
            self.view.addSubview(self.pickerView)
            self.activityIndicator.stopAnimating()
        }
    }
}

extension ViewController: FirstViewDataSource {
    
    func elementsCount(_ pickerView: PickerView) -> Int {
        
       guard let count = firstPresenter.astronauts?.count else { return 0}
        return count
    }
    
    func elementName(_ pickerView: PickerView, indexPath: IndexPath) -> String {
        
        guard let name = firstPresenter.astronauts?[indexPath.row].name else { return ""}
        guard let agency = firstPresenter.astronauts?[indexPath.row].agency else { return ""}
        return name + "   " + agency
    }
    
    func selectedElement(_ pickerView: PickerView, tag: Int) {
        firstPresenter.tapOnTheElement(tag: tag)
    }
}

