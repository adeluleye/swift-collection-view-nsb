//
//  AlbumsCell.swift
//  CollectionViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/8/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class AlbumsCell: UICollectionViewCell {
    
    var album: String? {
        didSet {
            if let imageName = album {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setCellShadow()
        addSubview(imageView)
        
        imageView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
}
