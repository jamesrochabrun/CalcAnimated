//
//  ButtonsContainerView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol ButtonsViewDelegate {
    func updateTipPercentage(_ tipPercentage: Double)
}

enum PercentageTip: String {
    case tenPercent = "10"
    case fifteenPercent = "15"
    case twentyPercent = "20"
}


class ButtonsView: UIView {
    
    var delegate: ButtonsViewDelegate! = nil
    
    let gradient:CAGradientLayer = CAGradientLayer()

    var color: GradientColor? {
        didSet {
            if let color = self.color {
                gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
            }
        }
    }
    
    lazy var tenButton: UIButton = {
        UIButton.withTitleText(PercentageTip.tenPercent.rawValue, target:self, selector: #selector(updateTipPercentage(_:)))
    }()
    
    lazy var fifteenButton: UIButton = {
        UIButton.withTitleText(PercentageTip.fifteenPercent.rawValue, target:self, selector: #selector(updateTipPercentage(_:)))
    }()
    
    lazy var twentyButton: UIButton = {
        UIButton.withTitleText(PercentageTip.twentyPercent.rawValue, target:self, selector: #selector(updateTipPercentage(_:)))
    }()
    
    let verticalLine : UIView = {
       let vL = UIView()
        vL.backgroundColor = Constants.APPColor.verticalLine
        vL.translatesAutoresizingMaskIntoConstraints = false
        return vL
    }()
    
    let verticalLineRight : UIView = {
        let vL = UIView()
        vL.backgroundColor = Constants.APPColor.verticalLine
        vL.translatesAutoresizingMaskIntoConstraints = false
        return vL
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        tenButton.backgroundColor = .clear
        fifteenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        twentyButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        addSubview(fifteenButton)
        addSubview(tenButton)
        addSubview(twentyButton)
        addSubview(verticalLine)
        addSubview(verticalLineRight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
        
        verticalLine.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        verticalLine.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        verticalLine.leftAnchor.constraint(equalTo: tenButton.rightAnchor).isActive = true
        verticalLine.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        verticalLineRight.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        verticalLineRight.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        verticalLineRight.leftAnchor.constraint(equalTo: fifteenButton.rightAnchor).isActive = true
        verticalLineRight.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

       addGradient()
    }
    
    func addGradient() {
        
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
}

extension ButtonsView {
    
    func updateTipPercentage(_ sender: UIButton) {
        
        tenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        fifteenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        twentyButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        sender.backgroundColor = .clear
        
        if let titleButton  = sender.titleLabel?.text {
            if let percentage = Double(titleButton) {
                delegate.updateTipPercentage(percentage)
            }
        }
    }
}






