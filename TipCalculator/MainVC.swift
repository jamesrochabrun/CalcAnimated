//
//  ViewController.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var keyBoardHeight: CGFloat = 0.0
    var actionViewHeight: CGFloat = 0.0
    let keyBoardNotification: String = "Knotification"

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
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    var textFieldLine: UIView = {
       let sV = UIView()
        sV.backgroundColor = .lightGray
        sV.translatesAutoresizingMaskIntoConstraints = false
        return sV
    }()
    
    lazy var actionsView: ActionsView = {
        let aV = ActionsView()
        aV.backgroundColor = .green
        return aV
    }()
    
    let containerTextFieldView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(gradientView)
        view.backgroundColor = .white
        containerTextFieldView.addSubview(amountTextField)
        containerTextFieldView.addSubview(textFieldLine)
        view.addSubview(containerTextFieldView)
        view.addSubview(actionsView)
        
        self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: view.frame.maxY)
        self.containerTextFieldView.transform = CGAffineTransform(translationX: 0.0, y: (view.frame.size.height - Constants.UI.containterTextfieldHeight) / 2)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var frame = containerTextFieldView.frame
        frame.size.width = view.frame.size.width
        frame.size.height = Constants.UI.containterTextfieldHeight
        frame.origin.x = 0
        frame.origin.y = (view.frame.size.height - frame.size.height) / 2
        containerTextFieldView.frame = frame
        
        amountTextField.heightAnchor.constraint(equalToConstant: Constants.UI.textFieldHeight).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: containerTextFieldView.widthAnchor, multiplier: 0.85).isActive = true
        amountTextField.centerXAnchor.constraint(equalTo: containerTextFieldView.centerXAnchor).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: containerTextFieldView.centerYAnchor).isActive = true
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.rightAnchor.constraint(equalTo: amountTextField.rightAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
        
        frame = actionsView.frame
        frame.origin.y = view.frame.maxY
        frame.origin.x = 0
        frame.size.width = view.frame.size.width
        frame.size.height = 140
        actionsView.frame = frame
    }
}


extension MainVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func keyBoardWillShow(notification: Notification) {
        
        if  let dictionary = notification.userInfo, let kbFrame = dictionary[UIKeyboardFrameEndUserInfoKey] as? CGRect  {
            
            self.keyBoardHeight = kbFrame.height
            self.actionViewHeight = 140
            
            UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations:{
                
                let actionsViewOriginY = self.view.frame.maxY - self.keyBoardHeight - self.actionViewHeight
                self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
                let containerOriginY = (actionsViewOriginY - self.containerTextFieldView.frame.height) / 2
                self.containerTextFieldView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
            }, completion: nil)
        }
    }
    
    func keyBoardWillHide() {
        
        self.keyBoardHeight = 0.0
        self.actionViewHeight = 0.0
        
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations:{
            
            let actionsViewOriginY = self.view.frame.maxY
            self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
            let containerOriginY = (self.view.frame.height - self.containerTextFieldView.frame.height) / 2
            self.containerTextFieldView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);
    }
}



















