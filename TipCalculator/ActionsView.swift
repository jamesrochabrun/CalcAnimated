//
//  ActionsView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    let buttonsContainerView: ButtonsContainerView = {
        let view = ButtonsContainerView()
        return view
    }()
    
    let tipView: TipView = {
       let view = TipView()
    return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonsContainerView)
        addSubview(tipView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonContainerHeight: CGFloat = 40.0
        buttonsContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonsContainerView.heightAnchor.constraint(equalToConstant: buttonContainerHeight).isActive = true
        buttonsContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonsContainerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        let tipContainerHeight: CGFloat = 100.0
        tipView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tipView.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        tipView.heightAnchor.constraint(equalToConstant: tipContainerHeight).isActive = true
        tipView.topAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor).isActive = true

    }
}






