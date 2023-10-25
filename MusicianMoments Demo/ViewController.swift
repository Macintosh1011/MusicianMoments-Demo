//
//  ViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var verticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customCell1 = CustomCell()
        let customCell2 = CustomCell()
 
        // Customize buttons in the first custom cell
        customCell1.setButtonProperties(index: 0, backgroundColor: .blue, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction1))
        customCell1.setButtonProperties(index: 1, backgroundColor: .green, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction2))
        customCell1.setButtonProperties(index: 2, backgroundColor: .red, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction3))
        customCell1.setButtonProperties(index: 3, backgroundColor: .purple, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction4))
        
        customCell1.setButtonProperties(index: 0, backgroundColor: .blue, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction1))
        customCell1.setButtonProperties(index: 1, backgroundColor: .green, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction2))
        customCell1.setButtonProperties(index: 2, backgroundColor: .red, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction3))
        customCell1.setButtonProperties(index: 3, backgroundColor: .purple, image: UIImage(named: "testImage")!, target: self, action: #selector(buttonAction4))

        customCell1.setImage(UIImage(named: "testImage")!)
        customCell2.setImage(UIImage(named: "testImage")!)
        verticalStackView.addArrangedSubview(customCell1)
        verticalStackView.addArrangedSubview(customCell2)
        
    }
    
    @objc func buttonAction1() {
        // Handle button 1 click
    }

    @objc func buttonAction2() {
        // Handle button 2 click
    }

    @objc func buttonAction3() {
        // Handle button 3 click
    }

    @objc func buttonAction4() {
        // Handle button 4 click
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
}

