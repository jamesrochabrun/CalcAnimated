//
//  TextfieldContainerview.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol TextfieldContainerviewDelegate {
    func updateAmountWithtextfieldValue(_ value:String)
}

class TextfieldContainerview: UIView {
    
    var delegate: TextfieldContainerviewDelegate! = nil
    
    lazy var amountTextField: UITextField  = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.lightGray
        textField.font = UIFont.init(name: Constants.Font.appMainFont, size: Constants.UI.textSizeBig)
        textField.textAlignment = .right
        textField.placeholder = "Enter bill amount"
        textField.keyboardType = UIKeyboardType.numberPad
        textField.addTarget(self, action: #selector(updateAmountWithtextfieldValue), for: .editingChanged)
        return textField
    }()
    
    var textFieldLine: UIView = {
        let sV = UIView()
        sV.translatesAutoresizingMaskIntoConstraints = false
        return sV
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addSubview(amountTextField)
        addSubview(textFieldLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        amountTextField.heightAnchor.constraint(equalToConstant: Constants.UI.textFieldHeight).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        amountTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.rightAnchor.constraint(equalTo: amountTextField.rightAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
        
        addGradient()
    }
    
    func addGradient() {
        
        let gradient = CAGradientLayer()
        gradient.frame = textFieldLine.bounds
        gradient.colors = [UIColor.hexStringToUIColor(Constants.APPColor.randomColors[0]).cgColor, UIColor.hexStringToUIColor(Constants.APPColor.randomColors[1]).cgColor]
        textFieldLine.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
}

extension TextfieldContainerview {
    
    func updateAmountWithtextfieldValue() {
        
        if let amountText = amountTextField.text {
            delegate.updateAmountWithtextfieldValue(amountText)
        }
    }
}











