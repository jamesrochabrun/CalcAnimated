//
//  ColorsVC.swift
//  TipCalculator
//
//  Created by James Rochabrun on 2/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit


class ColorsVC: UICollectionViewController {
    
    let cellID = "cellID"
    var colors: [GradientColor] = [GradientColor]()
    var color: GradientColor?
    var lastSelection: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select a gradient"
        collectionView?.backgroundColor = UIColor.hexStringToUIColor("#2f2e2d")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(changeColor))
        collectionView?.register(GradientCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        loadDummyColors()
    }
    
    func loadDummyColors() {
        
        let arrayTopColor = [Constants.APPColor.defaultMainColor, "#00f0ac", "#b9339e", "#ffff66","#ff6501", "#fc287b", "#ff18b9", "#f37682", "#fd28a4", "#f22d3f"]
        let arrayBottomColor =  [Constants.APPColor.defaultSecondaryColor, "#00cdef", "#2ecad9", "#00c44c", "fe01a9", "#ff7456", "#009245", "#00dcdb","#ffef8c", "#3c3a8d"]
        
        for n in 0..<arrayTopColor.count {
            let primaryHex = arrayTopColor[n]
            let secondaryHex = arrayBottomColor[n]
            let color = GradientColor(primary: primaryHex, secondary: secondaryHex)
            self.colors.append(color)
        }
    }

    func dismissView() {
        self.navigationController?.dismiss(animated: true)
    }
    
    func changeColor() {
        
        if let color = self.color {
            NotificationCenter.default.post(name: Notification.Name.myNotification, object: color)
        }
        dismissView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.myNotification, object: nil);
    }
}

extension ColorsVC {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GradientCell
        if  let color = self.colors[indexPath.row] as GradientColor? {
            cell.setupViewWithColor(color)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.color = self.colors[indexPath.row]
        if let cell = collectionView.cellForItem(at: indexPath) as? GradientCell {
            cell.overlay.isHidden = false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? GradientCell {
            cell.overlay.isHidden = true
        }
    }
}


extension ColorsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}







