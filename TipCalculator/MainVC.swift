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
    let actionViewHeightDefault: CGFloat = Constants.UI.buttonsViewHeight + Constants.UI.resultsViewHeight
    
    lazy var gradientView: UIView = {
        let gv = UIView()
        gv.createViewGradientwithFrame(self.view.frame, inView: self.view, topColor: Constants.APPColor.purple, bottomColor: Constants.APPColor.lightBlue, vertical: false)
        return gv
    }()
    
    lazy var actionsView: ActionsView = {
        let aV = ActionsView()
        return aV
    }()
    
    let textfieldContainerView: TextfieldContainerview = {
        let view = TextfieldContainerview()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(gradientView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        textfieldContainerView.delegate = self
        view.addSubview(textfieldContainerView)
        view.addSubview(actionsView)
        
        self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: view.frame.maxY)
        self.textfieldContainerView.transform = CGAffineTransform(translationX: 0.0, y: (view.frame.size.height - Constants.UI.textfieldViewHeight) / 2)
        
        var frame = textfieldContainerView.frame
        frame.size.width = view.frame.size.width
        frame.size.height = Constants.UI.textfieldViewHeight
        frame.origin.x = 0
        frame.origin.y = (view.frame.size.height - frame.size.height) / 2
        textfieldContainerView.frame = frame
        
        frame = actionsView.frame
        frame.origin.y = view.frame.maxY
        frame.origin.x = 0
        frame.size.width = view.frame.size.width
        frame.size.height = actionViewHeightDefault
        actionsView.frame = frame
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension MainVC: TextfieldContainerviewDelegate {
    
    func updateAmountWithtextfieldValue(_ value:String) {
        actionsView.setTipViewValuesWith(value)
    }
}

//MARK://Keyboard actions

extension MainVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func keyBoardWillShow(notification: Notification) {
        
        if  let dictionary = notification.userInfo, let kbFrame = dictionary[UIKeyboardFrameEndUserInfoKey] as? CGRect  {
            
            self.keyBoardHeight = kbFrame.height
            self.actionViewHeight = actionViewHeightDefault
            
            UIView.animate(withDuration: 0.3, animations: {
                let actionsViewOriginY = self.view.frame.maxY - self.keyBoardHeight - self.actionViewHeight
                self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
                let containerOriginY = (actionsViewOriginY - self.textfieldContainerView.frame.height) / 2
                self.textfieldContainerView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
            })
            
            UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.3, options: [], animations:{
                
                
            }, completion: nil)
        }
    }
    
    func keyBoardWillHide() {
        
        self.keyBoardHeight = 0.0
        self.actionViewHeight = 0.0
        
        UIView.animate(withDuration: 0.3, animations: {
            
            let actionsViewOriginY = self.view.frame.maxY
            self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
            let containerOriginY = (self.view.frame.height - self.textfieldContainerView.frame.height) / 2
            self.textfieldContainerView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
        })
        
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.3, options: [], animations:{
            
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);
    }
}



















