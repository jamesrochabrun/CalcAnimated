//
//  TextfieldContainerview.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol TextfieldViewDelegate {
    func updateAmountWithtextfieldValue(_ value:String)
}

class TextfieldView: UIView {
    
    var delegate: TextfieldViewDelegate! = nil
    var mainVC: MainVC!
    
    let gradient:CAGradientLayer = CAGradientLayer()
    var color: GradientColor? {
        didSet {
            if let color = self.color {
                gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
            }
        }
    }
    
    lazy var amountTextField: UITextField  = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.lightGray
        textField.font = UIFont.init(name: Constants.Font.appMainFont, size: Constants.UI.textSizeInputBig)
        textField.delegate = self
        textField.textAlignment = .right
        textField.placeholder = "Enter bill amount"
        textField.keyboardType = UIKeyboardType.decimalPad
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
        amountTextField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        amountTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.centerXAnchor.constraint(equalTo: amountTextField.centerXAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
        
        addGradient()
    }
    
    func addGradient() {
        
        gradient.frame = textFieldLine.bounds
        textFieldLine.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    func hideTextLine(_ hide: Bool) {
        
        if hide {
            textFieldLine.alpha = 0
        } else {
            textFieldLine.alpha = 1
        }
    }
}

extension TextfieldView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var maxCounter: Bool = true
        if let text = textField.text {
           maxCounter = text.length + (string.length - range.length) <= 12
        }
        return maxCounter
    }
}

extension TextfieldView {
    
    func updateAmountWithtextfieldValue() {
        
        if let amountText = amountTextField.text {
            delegate.updateAmountWithtextfieldValue(amountText)
        }
    }
}











