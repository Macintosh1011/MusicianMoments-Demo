//
//  random.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/25/23.
//

import UIKit

class CustomPossume: UIStackView {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var circleButtons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView1()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpView1()
    }
    
     private func setUpView1() {
        
         let horizontalStack = UIStackView()
         horizontalStack.axis = .horizontal
         horizontalStack.alignment = .center
         horizontalStack.spacing = 10
         addArrangedSubview(horizontalStack)
         
         let verticalStack = UIStackView()
         verticalStack.axis = .vertical
         verticalStack.spacing = 10
         horizontalStack.addArrangedSubview(verticalStack)
         
         
         
    }
    
    
    
    
    
    
}
