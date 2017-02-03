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

        static let textColor: UIColor = .white
        static let verticalLine: UIColor = .white
        static let bl: String = "#ffffff"
        static let wh: String = "#000000"
        static let randomColors: [String] = {
            var array = [String]()
            let arrayTopColor = ["#00f0ac", "#b9339e","#ff6501", "#fc287b", "#f37682", "#fd28a4", "#f22d3f" ]
            let arrayBottomColor =  ["#00cdef", "#2ecad9", "fe01a9", "#ff7456", "#00dcdb","#ffef8c", "#3c3a8d"]
            let index = Int(arc4random_uniform(UInt32(arrayTopColor.count)))
            let topColor = arrayTopColor[index]
            array.append(topColor)
            let bottomColor = arrayBottomColor[index]
            array.append(bottomColor)
            return array
        }()
    }
    
    struct UI {
        static let textfieldViewHeight: CGFloat = 80.0
        static let textFieldHeight: CGFloat = 50.0
        static let buttonsViewHeight: CGFloat = 40.0
        static let resultsViewHeight: CGFloat = 120.0
        static let textSizeBig: CGFloat = 30.0
        static let textSizeMedium: CGFloat = 25.0
        static let textSizeSmall: CGFloat = 20.0
        static let generalPadding: CGFloat = 10.0
        static let verticalPadding: CGFloat = 22.0
    }
    
    struct Font {
        static let appMainFont: String = "HelveticaNeue-Light"
    }
}
