//
//  CustomCell.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/25/23.
//

import UIKit

class CustomCircleCell: UITableViewCell {

    // Array to hold references to the circle buttons
    var circleButtons: [UIButton] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

      
        // Create a horizontal stack view
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20

        // Add the stack view to the cell's content view
        contentView.addSubview(stackView)

        // Constrain the stack view to the edges of the content view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        // Create and add circle buttons to the stack view
        for i in 1...4 {
            let circleButton = UIButton(type: .custom)
            circleButton.translatesAutoresizingMaskIntoConstraints = false
            circleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            circleButton.heightAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
            circleButton.layer.cornerRadius = 30
            circleButton.layer.masksToBounds = true
            circleButton.addTarget(self, action: #selector(circleButtonTapped(_:)), for: .touchUpInside)

            // Set a different image for each circle button
            let imageName = "photo\(i)"
            circleButton.setImage(UIImage(named: imageName), for: .normal)

            // Add the circle button to the stack view and the array
            stackView.addArrangedSubview(circleButton)
            circleButtons.append(circleButton)
        }
    }

    // Function to handle the tap on a circle button
    @objc func circleButtonTapped(_ sender: UIButton) {
        // Replace this with your logic to handle the tap for each button
        let index = circleButtons.firstIndex(of: sender) ?? 0
        print("Circle button \(index + 1) tapped!")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
