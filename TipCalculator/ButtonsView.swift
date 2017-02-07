//
//  ButtonsContainerView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol ButtonsViewDelegate: class {
  func updateTipPercentage(_ tipPercentage: Double)
}

class ButtonsView: UIView {
    
    weak var delegate: ButtonsViewDelegate?
    
    let gradient:CAGradientLayer = CAGradientLayer()

    var color: GradientColor? {
        didSet {
            if let color = self.color {
                gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
            }
        }
    }
    
    var percentage: Double? {
        didSet {
            if let percentage = self.percentage {
                self.updateButtonsViewWith(percentage: percentage)
            }
        }
    }
    
    lazy var tenButton: UIButton = {
        UIButton.withTitleText(Constants.PercentageTip.tenPercent, target:self, selector: #selector(updateTipPercentage(_:)))
    }()
    
    lazy var fifteenButton: UIButton = {
        UIButton.withTitleText(Constants.PercentageTip.fifteenPercent, target:self, selector: #selector(updateTipPercentage(_:)))
    }()
    
    lazy var twentyButton: UIButton = {
        UIButton.withTitleText(Constants.PercentageTip.twentyPercent, target:self, selector: #selector(updateTipPercentage(_:)))
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
        addSubview(fifteenButton)
        addSubview(tenButton)
        addSubview(twentyButton)
        addSubview(verticalLine)
        addSubview(verticalLineRight)
    }
    
    func updateButtonsViewWith(percentage: Double) {
        print("Buttons value change : \(percentage)")
        if let tenPercentDoubleValue = Double(Constants.PercentageTip.tenPercent), let fiftennPercentDoubleValue = Double(Constants.PercentageTip.fifteenPercent), let twentyPercentDoubleValue = Double(Constants.PercentageTip.twentyPercent) {
            
            switch percentage {
            case tenPercentDoubleValue:
                tenButton.backgroundColor = .clear
                fifteenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                twentyButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                
            case fiftennPercentDoubleValue:
                tenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                fifteenButton.backgroundColor = .clear
                twentyButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                
            case twentyPercentDoubleValue:
                tenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                fifteenButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                twentyButton.backgroundColor = .clear
            default:
                print(percentage)
            }
        }
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
                delegate?.updateTipPercentage(percentage)
            }
        }
    }
}






