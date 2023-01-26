//
//  FirstViewDataSource.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import Foundation

protocol FirstViewDataSource {
    
    func elementsCount(_ pickerView: PickerView) -> Int
    func elementName(_ pickerView: PickerView, indexPath: IndexPath) -> String
    func selectedElement(_ pickerView: PickerView, tag: Int)
}
