//
//  GradientCell.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class GradientCell: UICollectionViewCell {
    
    let gradient:CAGradientLayer = CAGradientLayer()
    
    var overlay: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3.0
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(overlay)
        overlay.frame = self.bounds
    }
    
    func setupViewWithColor(_ color: GradientColor) {
        
        gradient.frame = self.bounds
        
        DispatchQueue.main.async {
            self.layer.insertSublayer(self.gradient, at: 0)
            self.gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            self.gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            self.gradient.colors = [UIColor.hexStringToUIColor((color.primary)).cgColor, UIColor.hexStringToUIColor((color.secondary)).cgColor]
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
    }
    
}
