//
//  ButtonsContainerView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol ButtonsContainerViewDelegate {
    func updateTipPercentage(_ tipPercentage: Double)
}

class ButtonsContainerView: UIView {
    
    var delegate: ButtonsContainerViewDelegate! = nil
    var isSelected: Bool = false
    
    let gradientView: UIView = {
        let gv = UIView()
        return gv
    }()
    
    lazy var tenButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("10", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.3
        button.addTarget(self, action: #selector(updateTipPercentage(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var fifteenButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("15", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.3
        button.addTarget(self, action: #selector(updateTipPercentage(_:)), for: .touchUpInside)

        return button
    }()
    
    lazy var twentyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("20", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.3
        button.addTarget(self, action: #selector(updateTipPercentage), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradientView)
        addSubview(fifteenButton)
        addSubview(tenButton)
        addSubview(twentyButton)
    }
    
    func updateTipPercentage(_ sender: UIButton) {
        
        tenButton.backgroundColor = .clear
        fifteenButton.backgroundColor = .clear
        twentyButton.backgroundColor = .clear
        sender.backgroundColor = UIColor.white.withAlphaComponent(0.5)

        if let titleButton  = sender.titleLabel?.text {
            if let percentage = Double(titleButton) {
                delegate.updateTipPercentage(percentage)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientView.createViewGradientwithFrame(self.frame, inView: self, topColor: Constants.APPColor.orange, bottomColor: Constants.APPColor.coral)
        
        let buttonWidthMultiplier: CGFloat = 1/3
        
        fifteenButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        fifteenButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fifteenButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: buttonWidthMultiplier).isActive = true
        fifteenButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        tenButton.centerYAnchor.constraint(equalTo: fifteenButton.centerYAnchor).isActive = true
        tenButton.widthAnchor.constraint(equalTo: fifteenButton.widthAnchor).isActive = true
        tenButton.heightAnchor.constraint(equalTo: fifteenButton.heightAnchor).isActive = true
        tenButton.rightAnchor.constraint(equalTo: fifteenButton.leftAnchor).isActive = true
        
        twentyButton.centerYAnchor.constraint(equalTo: fifteenButton.centerYAnchor).isActive = true
        twentyButton.widthAnchor.constraint(equalTo: fifteenButton.widthAnchor).isActive = true
        twentyButton.heightAnchor.constraint(equalTo: fifteenButton.heightAnchor).isActive = true
        twentyButton.leftAnchor.constraint(equalTo: fifteenButton.rightAnchor).isActive = true
    }
}







