//
//  LaunchVC.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/2/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    lazy var gradientView: UIView = {
        let gv = UIView()
        gv.createViewGradientwithFrame(self.view.frame, inView: self.view, vertical: false)
        return gv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        let mainVC = MainVC()
        let navVC = UINavigationController(rootViewController: mainVC)
        self.present(navVC, animated: true)
    }
}
