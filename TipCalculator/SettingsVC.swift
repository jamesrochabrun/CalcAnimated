//
//  SettingsVC.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, ButtonsViewDelegate {
    
    let buttonsView: ButtonsView = {
        let view = ButtonsView()
        return view
    }()
    
    var color: GradientColor? {
        didSet {
            self.buttonsView.color = color
        }
    }
    
    var percentage: Double? {
        didSet {
            if let percentage = self.percentage {
                self.buttonsView.updateButtonsViewWith(percentage: percentage)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(updatePercentage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissView))
        view.addSubview(buttonsView)
    }

    func updatePercentage() {
        
        if let percentage = self.percentage {
            NotificationCenter.default.post(name: Notification.Name.percentageNotification, object: percentage)
        }
        dismissView()
    }
    
    func dismissView() {
        self.navigationController?.dismiss(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        buttonsView.delegate = self
        buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonsView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func updateTipPercentage(_ tipPercentage: Double) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(tipPercentage, forKey: "tip")
        userDefaults.synchronize()
        self.percentage = tipPercentage
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.percentageNotification, object: nil);
    }
}










