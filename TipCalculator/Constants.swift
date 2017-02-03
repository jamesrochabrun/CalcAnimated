//
//  Constants.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

struct Constants {
    
    struct APPColor {
        static let coral = "#fe486c"
        static let orange = "#ff6501"
        static let pink = "fe01a9"
        static let buttonBorderWhite = "#ffffff"
        static let lightGreen = "#a7f0e1"
        static let textColor: UIColor = .white
        
        static let purple = "#f80199" //"#b9339e"
        static let lightBlue = "#2ecad9" //"#f77336"
    }
    
    
    struct UI {
        static let textfieldViewHeight: CGFloat = 80.0
        static let textFieldHeight: CGFloat = 50.0
        static let buttonsViewHeight: CGFloat = 40.0
        static let resultsViewHeight: CGFloat = 100.0
        static let textSizeBig: CGFloat = 30.0
        static let textSizeMedium: CGFloat = 25.0
        static let textSizeSmall: CGFloat = 20.0
        static let generalPadding: CGFloat = 10.0
    }
    
    struct Font {
        static let appMainFont: String = "HelveticaNeue-Light"//"HelveticaNeue-Thin"
    }
}
