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
        let aV = ActionsView()//frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 140))
        aV.backgroundColor = .green
       // aV.translatesAutoresizingMaskIntoConstraints = false
        return aV
    }()
    
    let containerCustomtextFieldView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // view.addSubview(gradientView)
        view.backgroundColor = .white
        containerCustomtextFieldView.addSubview(amountTextField)
        containerCustomtextFieldView.addSubview(textFieldLine)
        view.addSubview(containerCustomtextFieldView)
        view.addSubview(actionsView)
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var frame = containerCustomtextFieldView.frame
        frame.size.width = view.frame.size.width
        frame.size.height = 80.0
        frame.origin.x = 0
        frame.origin.y = ((view.frame.size.height - frame.size.height) / 2) - self.actionViewHeight
        containerCustomtextFieldView.frame = frame
        
        amountTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: containerCustomtextFieldView.widthAnchor, multiplier: 0.85).isActive = true
        amountTextField.centerXAnchor.constraint(equalTo: containerCustomtextFieldView.centerXAnchor).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: containerCustomtextFieldView.centerYAnchor).isActive = true
        
        textFieldLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textFieldLine.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        textFieldLine.rightAnchor.constraint(equalTo: amountTextField.rightAnchor).isActive = true
        textFieldLine.topAnchor.constraint(equalTo: amountTextField.bottomAnchor).isActive = true
        
        frame = actionsView.frame
        frame.origin.y = view.frame.maxY - self.keyBoardHeight - self.actionViewHeight
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
        
        if  let dictionary = notification.userInfo {
            let kbFrame = dictionary[UIKeyboardFrameEndUserInfoKey] as? CGRect
            
            self.keyBoardHeight = (kbFrame?.height)!
            self.actionViewHeight = 140
            DispatchQueue.main.async {
                self.view.setNeedsLayout()
            }
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(1)
            UIView.setAnimationBeginsFromCurrentState(true)
            view.layoutIfNeeded()
            UIView.commitAnimations()
        }
    }
    
    func keyBoardWillHide() {
        
        DispatchQueue.main.async {
            self.view.setNeedsLayout()
        }

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.commitAnimations()
        self.keyBoardHeight = 0.0
        self.actionViewHeight = 0.0
        view.layoutIfNeeded()
        
        print("KB: \(self.keyBoardHeight)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);
    }
}



















