//
//  PickerView.swift
//  SpaceXAstronautsAndCustomView
//
//  Created by Александр Рахимов on 26.01.2023.
//

import UIKit

class PickerView: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private var elements = [UIButton]()
    
    public var dataSource: FirstViewDataSource? {
        
        didSet {
            self.setupView()
        }
    }
    
    private var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func setupView() {
        
        let count = dataSource?.elementsCount(self)
        
        guard let count = count else { return }
        for element in 0..<count {
            let indexPath = IndexPath(row: element, section: 1)
            let elementButton = UIButton(type: .system)
            elementButton.setTitle(dataSource?.elementName(self, indexPath: indexPath), for: .normal)
            elementButton.setTitleColor(.lightGray, for: .normal)
            elementButton.setTitleColor(.black, for: .selected)
            elementButton.tag = element
            elements.append(elementButton)
            self.addSubview(elementButton)
            elementButton.addTarget(self, action: #selector(elementButtonTapped), for: .touchUpInside)
        }
        
        stackView = UIStackView(arrangedSubviews: self.elements)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .leading
        self.addSubview(stackView)
    }
    
    @objc private func elementButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        let elementButton = elements[tag]
        
        if elementButton.tag == tag {
            dataSource?.selectedElement(self, tag: elementButton.tag)
        }
    }
    
}

