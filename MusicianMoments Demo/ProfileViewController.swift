//
//  ProfileViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/28/23.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

        
    lazy var containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1)
        cv.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: cv.centerXAnchor).isActive = true
        profileImageView.anchor(top: cv.topAnchor, paddingTop: 88, width: 120, height: 120)
        cv.addSubview(settingsButton)
        settingsButton.anchor(top: cv.topAnchor, right: cv.rightAnchor, paddingTop: 44, paddingRight: 32, width: 32, height: 32)
        return cv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pfp")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 60
        
        return imageView
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(named: "gear"), for: .normal)
        
        return button
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Idan Kestenbom"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    let emaillabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "@kestenbom_idan"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        view.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
        view.addSubview(nameLabel)
        view.addSubview(emaillabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)
        emaillabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 12)
        emaillabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.width/3)-4)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomProfileCollectionViewCell.self, forCellWithReuseIdentifier: CustomProfileCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        collectionView.frame = CGRect(x: 0, y: containerView.frame.maxY+400, width: view.frame.width, height: view.frame.height - containerView.frame.maxY)
 


        


    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomProfileCollectionViewCell.identifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1)
        return cell
    }

}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom!).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight!).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
