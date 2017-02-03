//
//  Color.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class GradientColor: NSObject {
    
    var primary: String
    var secondary: String
    
    init(primary: String, secondary: String) {
        self.primary = primary
        self.secondary = secondary
    }
}
