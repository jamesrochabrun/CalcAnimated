//
//  ViewController.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.


import UIKit

class MainVC: UIViewController {
    
    var keyBoardHeight: CGFloat = 0.0
    var actionViewHeight: CGFloat = 0.0
    let keyBoardNotification: String = "Knotification"
    let actionViewHeightDefault: CGFloat = Constants.UI.buttonsViewHeight + Constants.UI.resultsViewHeight
    
    var color: GradientColor = {
        let c = GradientColor(primary: "#b9339e", secondary: "#2ecad9")
        return c
    }()
    
    lazy var textfieldContainerView: TextfieldContainerview = {
        let view = TextfieldContainerview()
        view.color = self.color
        return view
    }()
    
    lazy var actionsView: ActionsView = {
        let aV = ActionsView()
        aV.color = self.color
        return aV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change color", style: .plain, target: self, action: #selector(showColorVC))
        
        self.title = "tip calculator"
        
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
    
    func showColorVC() {
        
        let colorsVC = ColorsVC(collectionViewLayout: UICollectionViewFlowLayout())
        colorsVC.color = self.color
        let navVC = UINavigationController.init(rootViewController: colorsVC)
        DispatchQueue.main.async {
            self.present(navVC, animated: true, completion: nil)
        }
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeColors(_:)), name: NSNotification.Name.myNotification, object: nil)
    }
    
    func keyBoardWillShow(notification: Notification) {
        
        if  let dictionary = notification.userInfo, let kbFrame = dictionary[UIKeyboardFrameEndUserInfoKey] as? CGRect  {
            
            self.keyBoardHeight = kbFrame.height
            self.actionViewHeight = actionViewHeightDefault
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, animations: {

                    let actionsViewOriginY = self.view.frame.maxY - self.keyBoardHeight - self.actionViewHeight
                    self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
                    let containerOriginY = (actionsViewOriginY - self.textfieldContainerView.frame.height) / 2
                    self.textfieldContainerView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
                })
            }
        }
    }
    
    func keyBoardWillHide() {
        
        self.keyBoardHeight = 0.0
        self.actionViewHeight = 0.0
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                
                let actionsViewOriginY = self.view.frame.maxY
                self.actionsView.transform = CGAffineTransform(translationX: 0.0, y: actionsViewOriginY)
                let containerOriginY = (self.view.frame.height - self.textfieldContainerView.frame.height) / 2
                self.textfieldContainerView.transform = CGAffineTransform(translationX: 0.0, y: containerOriginY)
            })
        }
    }
    
    func changeColors(_ notification: NSNotification) {
        
        if let color = notification.object as? GradientColor {
            self.color.primary = (color.primary)
            self.color.secondary = (color.secondary)
            actionsView.color = self.color
            textfieldContainerView.color = self.color
        } else {
            print("THE OBJECT IN NOTIFICATION IS NIL!: \(notification.object)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil);

    }
}
















