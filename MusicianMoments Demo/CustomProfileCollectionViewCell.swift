//
//  CustomCollectionViewCell.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/29/23.
//

import UIKit

class CustomProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomProfileCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let mylabel: UILabel = {
        let label = UILabel()
        label.text = "08/29/2023"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
        contentView.addSubview(mylabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        
        mylabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
        
     
    }
}
