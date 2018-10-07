//
//  ViewController.swift
//  CollectionViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/7/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let image = UIImage(named: "bg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.setAnchor(top: view.topAnchor, topPad: 0, bottom: view.bottomAnchor, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0, height: 0, width: 0)
    }


}

