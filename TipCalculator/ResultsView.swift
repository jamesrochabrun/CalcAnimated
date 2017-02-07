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
        UILabel.withText("+", andFontSize: Constants.UI.textSizeMedium)
    }()
    let tipValueLabel: UILabel  = {
        UILabel.withText("$ 0.00", andFontSize: Constants.UI.textSizeMedium)
    }()
    let totalLabel: UILabel  = {
        UILabel.withText("=", andFontSize: Constants.UI.textSizeBig)
    }()
    let totalValueLabel: UILabel  = {
        UILabel.withText("$ 0.00", andFontSize: Constants.UI.textSizeBig)
    }()
    
    let splitInTwoIconLabel: UILabel = {
        UILabel.withText("..", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let splitInTwoLabel: UILabel = {
        UILabel.withText("$ 0.00", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let splitInThreeIconLabel: UILabel = {
        UILabel.withText("...", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let splitInThreeLabel: UILabel = {
        UILabel.withText("$ 0.00", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let splitInFourIconLabel: UILabel = {
        UILabel.withText("....", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let splitInFourLabel: UILabel = {
        UILabel.withText("$ 0.00", andFontSize: Constants.UI.textSizeSmall)
    }()
    
    let gradient:CAGradientLayer = CAGradientLayer()
    var color: GradientColor? {
        didSet {
            if let color = self.color {
                gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
            }
        }
    }
    
    var percentage: Double?
    var amount: String?
    
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
        addSubview(splitInTwoIconLabel)
        addSubview(splitInTwoLabel)
        addSubview(splitInThreeIconLabel)
        addSubview(splitInThreeLabel)
        addSubview(splitInFourIconLabel)
        addSubview(splitInFourLabel)
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
        
        splitInTwoIconLabel.sizeToFit()
        splitInTwoIconLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.generalPadding).isActive = true
        splitInTwoIconLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: Constants.UI.verticalPadding).isActive = true
        
        splitInTwoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.generalPadding).isActive = true
        splitInTwoLabel.topAnchor.constraint(equalTo: totalValueLabel.bottomAnchor, constant: Constants.UI.verticalPadding).isActive = true
        splitInTwoLabel.leftAnchor.constraint(equalTo: splitInTwoIconLabel.rightAnchor, constant: Constants.UI.generalPadding).isActive = true
        
        splitInThreeIconLabel.sizeToFit()
        splitInThreeIconLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.generalPadding).isActive = true
        splitInThreeIconLabel.topAnchor.constraint(equalTo: splitInTwoIconLabel.bottomAnchor, constant: Constants.UI.verticalPadding).isActive = true
        
        splitInThreeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.generalPadding).isActive = true
        splitInThreeLabel.topAnchor.constraint(equalTo: splitInThreeIconLabel.topAnchor).isActive = true
        splitInThreeLabel.leftAnchor.constraint(equalTo: splitInThreeIconLabel.rightAnchor, constant: Constants.UI.generalPadding).isActive = true
        
        splitInFourIconLabel.sizeToFit()
        splitInFourIconLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.generalPadding).isActive = true
        splitInFourIconLabel.topAnchor.constraint(equalTo: splitInThreeIconLabel.bottomAnchor, constant: Constants.UI.verticalPadding).isActive = true
        
        splitInFourLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.generalPadding).isActive = true
        splitInFourLabel.topAnchor.constraint(equalTo: splitInFourIconLabel.topAnchor).isActive = true
        splitInFourLabel.leftAnchor.constraint(equalTo: splitInThreeIconLabel.rightAnchor, constant: Constants.UI.generalPadding).isActive = true
        
        addGradient()
    }
    
    func addGradient() {
        
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func displayResultValues() {
        
        if let amount = self.amount , let bill = Double(amount), let percentage = self.percentage {
            let tip = bill * percentage / 100
            let total = bill + tip
            tipValueLabel.text = String(format: "$ %.2f", tip)
            totalValueLabel.text = String(format: "$ %.2f", total)
            
            let totalDividedByTwo = total / 2.0
            splitInTwoLabel.text = String(format: "$ %.2f", totalDividedByTwo)
            let totalDividedBythree = total / 3.0
            splitInThreeLabel.text = String(format: "$ %.2f", totalDividedBythree)
            let totalDividedByFour = total / 4.0
            splitInFourLabel.text = String(format: "$ %.2f", totalDividedByFour)
        } else {
            totalValueLabel.text = "$ 0.00"
            tipValueLabel.text = "$ 0.00"
            splitInTwoLabel.text = "$ 0.00"
            splitInThreeLabel.text = "$ 0.00"
            splitInFourLabel.text = "$ 0.00"
        }
    }
}





