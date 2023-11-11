//
//  ViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/24/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
   @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func recordAction(_ sender: Any) {
        let vc = CameraViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func vanshButton(_ sender: Any) {
        let vc = GenericProfile()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // #2
            imageView.isUserInteractionEnabled = true
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            imageView.addGestureRecognizer(tapRecognizer)

            // #3
            imageView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        print("Image was tapped")
        
        
    }

}
