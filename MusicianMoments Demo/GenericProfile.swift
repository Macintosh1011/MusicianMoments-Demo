//
//  JohnProfile.swift
//  MusicianMoments Demo
//
//  Created by Mishali Pandey on 11/9/23.
//

import UIKit

class GenericProfile: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var selecteduserr: String? = nil
    var postsImageArray = [UIImage(named: "Vansh1"),UIImage(named: "Vansh2"),UIImage(named: "Vansh3"),UIImage(named: "Vansh4"),UIImage(named: "Vansh5"),UIImage(named: "Vansh6"),UIImage(named: "Vansh7"),UIImage(named: "Vansh8"),UIImage(named: "Vansh9")]
    lazy var containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1)
        cv.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: cv.centerXAnchor).isActive = true
        profileImageView.anchor(top: cv.topAnchor, paddingTop: 88, width: 120, height: 120)
        cv.addSubview(settingsButton)
        cv.addSubview(backButton)
        settingsButton.anchor(top: cv.topAnchor, right: cv.rightAnchor, paddingTop: 44, paddingRight: 32, width: 32, height: 32)
        backButton.anchor(top: cv.topAnchor, left: cv.leftAnchor, paddingTop: 44, paddingLeft: 32, width: 32, height: 32)
        cv.bringSubviewToFront(backButton)
        return cv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pfp1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 60
        
        return imageView
    }()
    
    let aboutTitle: UIButton = {
        let button = UIButton()
        button.setTitle("About", for: .normal)
        button.setTitleColor(UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1), for: .normal) // Set text color to red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        return button
    }()
    
    let postsTitle: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1), for: .normal) // Set text color to red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        return button
    }()

    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(named: "gear"), for: .normal)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        
        return button
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Vansh Bahety"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    let emaillabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "@Vunchie_Munchie"
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
        view.addSubview(aboutTitle)
        
        aboutTitle.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 55)
        view.addSubview(postsTitle)
        postsTitle.anchor(top: containerView.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingRight: 55)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)
        emaillabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 12)
        emaillabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-12, height: (view.frame.size.width/3)-12)
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
 
        backButton.addTarget(self, action: #selector(backbuttonpressed), for: .touchUpInside)


        


    }
    

    @objc func backbuttonpressed() {
        
        self.dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomProfileCollectionViewCell.identifier, for: indexPath) as! CustomProfileCollectionViewCell
        cell.contentView.backgroundColor = UIColor(red: 81/255, green: 15/255, blue: 15/255, alpha: 1)
        
        
        cell.configure(label: "08/\(indexPath.row+1)/2023", image: postsImageArray[indexPath.row])
        return cell
    }

}


