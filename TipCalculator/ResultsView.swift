//
//  TipView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ResultsView: UIView {
    
    let tipLabel: UILabel  = {
        UILabel.withText("+", andFontSize: Constants.UI.textSizeSmall)
    }()
    let tipValueLabel: UILabel  = {
        UILabel.withText("$ 00.00", andFontSize: Constants.UI.textSizeMedium)
    }()
    let totalLabel: UILabel  = {
        UILabel.withText("=", andFontSize: Constants.UI.textSizeMedium)
    }()
    let totalValueLabel: UILabel  = {
        UILabel.withText("$ 00.00", andFontSize: Constants.UI.textSizeBig)
    }()
    
    let gradient:CAGradientLayer = CAGradientLayer()
    var color: GradientColor? {
        didSet {
            if let color = self.color {
                gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)

        addSubview(tipLabel)
        addSubview(tipValueLabel)
        addSubview(totalLabel)
        addSubview(totalValueLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tipLabel.sizeToFit()
        tipLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.generalPadding).isActive = true
        tipLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.verticalPadding).isActive = true
        
        tipValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.generalPadding).isActive = true
        tipValueLabel.topAnchor.constraint(equalTo: tipLabel.topAnchor).isActive = true
        tipValueLabel.leftAnchor.constraint(equalTo: tipLabel.rightAnchor, constant: Constants.UI.generalPadding).isActive = true
        
        totalLabel.sizeToFit()
        totalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.generalPadding).isActive = true
        totalLabel.topAnchor.constraint(equalTo: tipValueLabel.bottomAnchor, constant: Constants.UI.verticalPadding).isActive = true
        
        totalValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.generalPadding).isActive = true
        totalValueLabel.topAnchor.constraint(equalTo: totalLabel.topAnchor).isActive = true
        totalValueLabel.leftAnchor.constraint(equalTo: totalLabel.rightAnchor, constant: Constants.UI.generalPadding).isActive = true
        
        addGradient()
    }
    
    func addGradient() {
        
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func updateValuesWith(_ amount:String, percentage:Double) {
        
        let bill = Double(amount) ?? 0
        let tip = bill * percentage / 100
        let total = bill + tip
        tipValueLabel.text = String(format: "$ %.2f", tip)
        totalValueLabel.text = String(format: "$ %.2f", total)
    }
    
    
    
    
    
    
    
    
    
}
