//
//  ViewController.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    

    let textFieldHeight: CGFloat = 70
    
    lazy var gradientView: UIView = {
        let gv = UIView()
        gv.createViewGradientwithFrame(self.view.frame, inView: self.view, topColor: Constants.APPColor.lightBlue, bottomColor: Constants.APPColor.lightGreen)
        return gv
    }()
    
    var amountTextField: UITextField  = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.textAlignment = .right
        textField.placeholder = "Enter bill amount"
        return textField
    }()
    
    var textFieldLine: UIView = {
       let sV = UIView()
        sV.backgroundColor = .lightGray
        sV.translatesAutoresizingMaskIntoConstraints = false
        return sV
    }()
    
    lazy var actionsView: ActionsView = {
        let aV = ActionsView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 140))
        aV.backgroundColor = .green
        return aV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // view.addSubview(gradientView)
        view.backgroundColor = .white
        view.addSubview(amountTextField)
        view.addSubview(textFieldLine)
        view.addSubview(actionsView)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        amountTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.rightAnchor.constraint(equalTo: amountTextField.rightAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
    }

}



















