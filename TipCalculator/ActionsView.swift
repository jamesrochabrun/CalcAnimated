//
//  ActionsView.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    var percentage: Double = 10
    var amount: String = ""
    
    var color: GradientColor? {
        didSet {
            self.buttonsView.color = color
            self.resultView.color = color
        }
    }
    
    lazy var buttonsView: ButtonsView = {
        let view = ButtonsView()
        return view
    }()
    
    lazy var resultView: ResultsView = {
        let view = ResultsView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonsView.delegate = self
        resultView.updateValuesWith(self.amount, percentage: percentage)
        addSubview(buttonsView)
        addSubview(resultView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonsViewHeight: CGFloat = Constants.UI.buttonsViewHeight
        buttonsView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonsView.heightAnchor.constraint(equalToConstant: buttonsViewHeight).isActive = true
        buttonsView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonsView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        let resultsViewHeight: CGFloat = Constants.UI.resultsViewHeight
        resultView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultView.widthAnchor.constraint(equalTo: buttonsView.widthAnchor).isActive = true
        resultView.heightAnchor.constraint(equalToConstant: resultsViewHeight).isActive = true
        resultView.topAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
    }
    
    func setTipViewValuesWith(_ amount:String) {
        self.amount = amount
        resultView.updateValuesWith(self.amount, percentage: percentage)
    }
    
}

extension ActionsView: ButtonsViewDelegate {
    
    func updateTipPercentage(_ tipPercentage: Double) {
        percentage = tipPercentage
        resultView.updateValuesWith(self.amount, percentage: percentage)
    }
}






