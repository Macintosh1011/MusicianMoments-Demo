//
//  CustomCell.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/25/23.
//

import UIKit

class CustomCell: UIStackView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.clipsToBounds = true // Ensure the image is clipped to the frame
        return imageView
    }()
    
    var circleButtons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Create a horizontal stack view to hold the image and vertical stack view
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.spacing = 10
        addArrangedSubview(horizontalStack)
        
        // Create a vertical stack view to hold the circle buttons
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 10
        horizontalStack.addArrangedSubview(verticalStack)
        
        for _ in 0..<4 {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = button.frame.width / 2
            button.clipsToBounds = true
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            verticalStack.addArrangedSubview(button)
            circleButtons.append(button)
        }
        
        // Add the image view to the horizontal stack
        horizontalStack.addArrangedSubview(imageView)
    }
    
    func setButtonProperties(index: Int, backgroundColor: UIColor, image: UIImage, target: Any?, action: Selector) {
        if index >= 0 && index < 4 {
            let button = circleButtons[index]
            button.backgroundColor = backgroundColor
            button.setImage(image, for: .normal)
            button.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
