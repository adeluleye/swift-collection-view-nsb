//
//  ViewController.swift
//  CollectionViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/7/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let backgroundImageView: UIImageView = {
        let image = UIImage(named: "Bitmap")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let imagesCellId = "imagesCellId"
    let albumsCellId = "albumsCellId"
    
    let imagesArray = ["image1", "image2", "image3", "image4", "image5"]
    let albumsArray = ["album1", "album2", "album3", "album4", "album5", "album6", "album7", "album8", "album9", "album8", "album8", "album8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ImagesCell.self, forCellWithReuseIdentifier: imagesCellId)
        collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: albumsCellId)
        
        setupViews()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)
        
        backgroundImageView.setAnchor(top: view.topAnchor, topPad: 0, bottom: view.bottomAnchor, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        collectionView.setAnchor(top: view.topAnchor, topPad: 0, bottom: view.bottomAnchor, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return albumsArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! AlbumsCell
            cell.album = albumsArray[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! ImagesCell
        cell.images = imagesArray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}


class ImagesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // make it scrollable
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        addSubview(collectionView)
        collectionView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    private class IconsCell: UICollectionViewCell {
        
        // add image view
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
        
        func setup() {
            
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
}

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
        addSubview(imageView)
        
        imageView.setAnchor(top: topAnchor, topPad: 0, bottom: bottomAnchor, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
    }
    
}
