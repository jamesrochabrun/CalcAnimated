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
        textField.textColor = .gray
        textField.backgroundColor = .red
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.textAlignment = .right
        textField.placeholder = "Enter bill amount"
        textField.keyboardType = UIKeyboardType.numberPad
        textField.addTarget(self, action: #selector(updateAmountWithtextfieldValue), for: .editingChanged)
        return textField
    }()
    
    var textFieldLine: UIView = {
        let sV = UIView()
        sV.backgroundColor = .lightGray
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
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.rightAnchor.constraint(equalTo: amountTextField.rightAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
    }
}

extension TextfieldContainerview {
    
    func updateAmountWithtextfieldValue() {
        
        if let amountText = amountTextField.text {
            delegate.updateAmountWithtextfieldValue(amountText)
        }
    }
}










