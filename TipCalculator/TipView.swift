//
//  TipView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class TipView: UIView {
    
    let textSizeBig: CGFloat = 25.0
    let textSizeSmall: CGFloat = 20.0
    let textColor: UIColor = .lightGray
    
    lazy var tipLabel: UILabel  = {
        let label = UILabel()
        label.text = "Tip"
        label.textColor = self.textColor
        label.font  = UIFont.systemFont(ofSize: self.textSizeSmall)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "$00.00"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.textColor
        label.font  = UIFont.systemFont(ofSize: self.textSizeSmall)
        return label
    }()
    
    lazy var totalLabel: UILabel  = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = self.textColor
        label.font  = UIFont.systemFont(ofSize: self.textSizeBig)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalValueLabel: UILabel  = {
        let label = UILabel()
        label.text = "$100.00"
        label.textColor = self.textColor
        label.font  = UIFont.systemFont(ofSize: self.textSizeBig)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // self.backgroundColor  = .red
        self.translatesAutoresizingMaskIntoConstraints = false
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
        
        tipValueLabel.sizeToFit()
        tipValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        tipValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        
        tipLabel.sizeToFit()
        tipLabel.rightAnchor.constraint(equalTo: tipValueLabel.leftAnchor, constant: -8).isActive = true
        tipLabel.topAnchor.constraint(equalTo: tipValueLabel.topAnchor).isActive = true
        
        totalValueLabel.sizeToFit()
        totalValueLabel.rightAnchor.constraint(equalTo: tipValueLabel.rightAnchor).isActive = true
        totalValueLabel.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 18).isActive = true
        
        totalLabel.sizeToFit()
        totalLabel.rightAnchor.constraint(equalTo: totalValueLabel.leftAnchor, constant: -8).isActive = true
        totalLabel.topAnchor.constraint(equalTo: totalValueLabel.topAnchor).isActive = true
    }
    
}
