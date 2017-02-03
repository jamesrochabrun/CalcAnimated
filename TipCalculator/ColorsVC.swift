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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select a color"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CLOSE", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(changeColor))
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.backgroundColor = .red
        collectionView?.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! WordCell
        return cell
    }
    

    func dismissView() {
        self.navigationController?.dismiss(animated: true)
    }
    
    func changeColor() {
        
        let color = GradientColor(primary: "#fc287b", secondary: "#3c3a8d")
        NotificationCenter.default.post(name: Notification.Name.myNotification, object: color)
        dismissView()
        
    }
}


extension ColorsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}



class WordCell: UICollectionViewCell {
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupViews() {
        addSubview(wordLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
