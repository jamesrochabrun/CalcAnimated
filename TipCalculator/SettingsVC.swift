//
//  SettingsVC.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var appereance: Bool?  {
        didSet {
            if let b = self.appereance {
                self.segmentedController.selectedSegmentIndex = b ? 1 : 0
            }
        }
    }

    lazy var buttonsView: ButtonsView = {
        let view = ButtonsView()
        view.delegate = self
        return view
    }()
    
    var color: GradientColor? {
        didSet {
            if let color = self.color {
                self.buttonsView.color = color
                self.segmentedController.layer.borderColor = UIColor.hexStringToUIColor(color.primary).cgColor
                self.segmentedController.tintColor = UIColor.hexStringToUIColor(color.primary)
            }
        }
    }
    
    var percentage: Double? {
        didSet {
            if let percentage = self.percentage {
                self.buttonsView.updateButtonsViewWith(percentage: percentage)
            }
        }
    }
    
    let infoLabel: UILabel  = {
        UILabel.withText("Default tip amount:", andFontSize: Constants.UI.textSizeBig)
    }()
    
    let appereanceLabel: UILabel  = {
        UILabel.withText("Change Keyboard Appereance", andFontSize: Constants.UI.textSizeBig)
    }()
    
    lazy var segmentedController: UISegmentedControl = {
        let sC = UISegmentedControl(items: ["Light", "Dark"])
        sC.addTarget(self, action: #selector(appereanceChanged), for: .valueChanged)
        sC.translatesAutoresizingMaskIntoConstraints = false
        sC.layer.borderWidth = 2.0
        sC.layer.cornerRadius = 10
        sC.clipsToBounds = true
        return sC
    }()
        
    func appereanceChanged() {
        
        if segmentedController.selectedSegmentIndex == 0 {
            self.appereance = false
        } else {
            self.appereance = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.textColor = UIColor.hexStringToUIColor(Constants.APPColor.textColorWhiteBG)
        appereanceLabel.textColor = UIColor.hexStringToUIColor(Constants.APPColor.textColorWhiteBG)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSettings))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissView))
        view.addSubview(infoLabel)
        view.addSubview(buttonsView)
        view.addSubview(appereanceLabel)
        view.addSubview(segmentedController)
    }

    func saveSettings() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.appereance, forKey: Constants.DefaultKeys.keyboardAppereance)
        userDefaults.synchronize()
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
        
        
        appereanceLabel.sizeToFit()
        appereanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appereanceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedController.topAnchor.constraint(equalTo: appereanceLabel.bottomAnchor, constant: 30).isActive = true
        segmentedController.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        buttonsView.bottomAnchor.constraint(equalTo: appereanceLabel.topAnchor, constant: -40).isActive = true
        buttonsView.widthAnchor.constraint(equalTo: segmentedController.widthAnchor).isActive = true
        buttonsView.heightAnchor.constraint(equalTo: segmentedController.heightAnchor).isActive = true
        buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        infoLabel.sizeToFit()
        infoLabel.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: -30).isActive  = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.percentageNotification, object: nil);
    }
}

extension SettingsVC: ButtonsViewDelegate {
    
    func updateTipPercentage(_ tipPercentage: Double) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(tipPercentage, forKey: "tip")
        userDefaults.synchronize()
        self.percentage = tipPercentage
    }
}










