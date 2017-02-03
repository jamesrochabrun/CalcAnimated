//
//  Extensions.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

extension UIView {
    
    func createViewGradientwithFrame(_ frame: CGRect, inView view: UIView, vertical: Bool) {
        
        self.frame = frame
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.hexStringToUIColor(Constants.APPColor.randomColors[0]).cgColor, UIColor.hexStringToUIColor(Constants.APPColor.randomColors[1]).cgColor]
        self.layer.insertSublayer(gradient, at: 0)
        if vertical {
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
    }
}


extension UIColor {
    
    static func hexStringToUIColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UILabel {
    
    static func withText(_ text: String, andFontSize size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = Constants.APPColor.textColor
        label.font = UIFont.init(name: Constants.Font.appMainFont, size: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }
}

extension UIButton {
    
    static func withTitleText(_ text: String, target: Any , selector: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(text, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(target, action: selector, for: .touchUpInside)
        return button
    }
}

extension String {
    var length: Int {
        return self.characters.count
    }
}





