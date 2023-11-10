//
//  FinalTouchViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 11/10/23.
//

import UIKit
import AVKit

class FinalTouchViewController: UIViewController {
    
    
     var recordedVideoURL: Any?
    var player: AVPlayer?
    
    // Declare your UI components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Title"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let textField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Text Field 1"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let textField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Text Field 2"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the UI components to the view
        view.addSubview(titleLabel)
        view.addSubview(textField1)
        view.addSubview(textField2)
        
        // Layout constraints for the UI components
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            textField2.topAnchor.constraint(equalTo: textField1.topAnchor),
            textField2.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            textField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        // Add a video player layer to the view
      
        let urll = UserDefaults.standard.url(forKey: "URL")
        player = AVPlayer(url: urll!)
            let playerLayer = AVPlayerLayer(player: player)
            
            // Adjust the frame as needed
            playerLayer.frame = self.view.bounds
            playerLayer.videoGravity = .resizeAspect
            self.view.layer.addSublayer(playerLayer)
        
            
            // Play the video
            player?.play()
        
    }
}



